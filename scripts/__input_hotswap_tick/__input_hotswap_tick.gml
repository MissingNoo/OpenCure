//feather disable all
/// @param [setAutoProfile=true]

function __input_hotswap_tick()
{
    __INPUT_GLOBAL_STATIC_LOCAL  //Set static _global
    
    with(_global.__players[0])
    {
        if (__ghost)
        {
            if (!__INPUT_SILENT) __input_trace("Warning! Cannot hotswap because player 0 is a ghost");
            return false;
        }
        
        if ((__last_input_time < 0) || (_global.__current_time - __last_input_time > INPUT_HOTSWAP_DELAY)) //If enough time has passed since the last input
        && ((__rebind_state <= 0) || !is_array(__rebind_source_filter) || (array_length(__rebind_source_filter) <= 0)) //And we're not rebinding, or the rebinding source filter is empty
        {
            var _new_source = __input_hotswap_tick_input();
            if ((_new_source != undefined) && !__source_contains(_new_source))
            {
                input_source_set(_new_source, 0, INPUT_HOTSWAP_AUTO_PROFILE);
                
                if (is_method(_global.__hotswap_callback))
                {
                    _global.__hotswap_callback();
                }
                else if (is_numeric(_global.__hotswap_callback) && script_exists(_global.__hotswap_callback))
                {
                    script_execute(_global.__hotswap_callback);
                }
                else if (_global.__hotswap_callback != undefined)
                {
                    __input_error("Hotswap callback set to an illegal value (typeof=", typeof(_global.__hotswap_callback), ")");
                }
            }
        }
    }
}

/// @param playerIndex
function __input_hotswap_tick_input()
{
    __INPUT_GLOBAL_STATIC_LOCAL  //Set static _global
    
    //Check gamepad input before keyboard input to correctly handle Android duplicating button presses with keyboard presses
    if (_global.__any_gamepad_binding_defined)
    {
        var _gamepad_count = array_length(INPUT_GAMEPAD);
        var _g = 0;
        
        #region In-use gamepad
        
        repeat(_gamepad_count)
        {
            if (gamepad_is_connected(_g) && input_source_using(INPUT_GAMEPAD[_g]))
            {                    
                //Check buttons
                if (input_gamepad_check(_g, gp_face1)
                ||  input_gamepad_check(_g, gp_face2)
                ||  input_gamepad_check(_g, gp_face3)
                ||  input_gamepad_check(_g, gp_face4)
                ||  input_gamepad_check(_g, gp_padu)
                ||  input_gamepad_check(_g, gp_padd)
                ||  input_gamepad_check(_g, gp_padl)
                ||  input_gamepad_check(_g, gp_padr)
                ||  input_gamepad_check(_g, gp_shoulderl)
                ||  input_gamepad_check(_g, gp_shoulderr)
                ||  input_gamepad_check(_g, gp_start)
                ||  input_gamepad_check(_g, gp_select)
                ||  input_gamepad_check(_g, gp_stickl)
                ||  input_gamepad_check(_g, gp_stickr)
                ||  (!input_gamepad_is_axis(_g, gp_shoulderlb) && input_gamepad_check(_g, gp_shoulderlb))
                ||  (!input_gamepad_is_axis(_g, gp_shoulderrb) && input_gamepad_check(_g, gp_shoulderrb)))
                {
                    break;
                }
                    
                //Check axes
                if (INPUT_HOTSWAP_ON_GAMEPAD_AXIS)
                {
                    if ((abs(input_gamepad_value(_g, gp_shoulderlb)) > input_axis_threshold_get(gp_shoulderlb, 0).mini)
                    ||  (abs(input_gamepad_value(_g, gp_shoulderrb)) > input_axis_threshold_get(gp_shoulderrb, 0).mini)
                    ||  (abs(input_gamepad_value(_g, gp_axislv    )) > input_axis_threshold_get(gp_axislv, 0).mini)
                    ||  (abs(input_gamepad_value(_g, gp_axislh    )) > input_axis_threshold_get(gp_axislh, 0).mini)
                    ||  (abs(input_gamepad_value(_g, gp_axislv    )) > input_axis_threshold_get(gp_axislv, 0).mini)
                    ||  (abs(input_gamepad_value(_g, gp_axisrh    )) > input_axis_threshold_get(gp_axisrh, 0).mini)
                    ||  (abs(input_gamepad_value(_g, gp_axisrv    )) > input_axis_threshold_get(gp_axisrv, 0).mini))
                    {
                        break;
                    }
                }
                    
                //Check extended
                if (INPUT_SDL2_ALLOW_EXTENDED)
                {
                    if (input_gamepad_check(_g, gp_guide)
                    ||  input_gamepad_check(_g, gp_misc1)
                    ||  input_gamepad_check(_g, gp_touchpad)
                    ||  input_gamepad_check(_g, gp_paddle1)
                    ||  input_gamepad_check(_g, gp_paddle2)
                    ||  input_gamepad_check(_g, gp_paddle3)
                    ||  input_gamepad_check(_g, gp_paddle4))
                    {
                        break;
                    }
                }
            }
            
            ++_g;
        }
        
        #endregion
        
        if (_g < _gamepad_count)
        {
            //Maintain in-use gamepad
            _global.__players[0].__last_input_time = _global.__current_time;
            return INPUT_GAMEPAD[_g];
        }
        else if not (_global.__frame - _global.__window_focus_frame < 2) //Prevent resting axes from triggering source swap
        {
            //Test available gamepads
            var _sort_order = 1;
            _g = 0;
            
            if (!__INPUT_ON_WEB && ((os_type == os_macosx)
            || (!_global.__using_steamworks && (os_type == os_windows))
            || ( _global.__using_steamworks && (os_type == os_linux))))
            {
                //Search last-to-first on platforms with low-index virtual controllers (Steam Input, ViGEm)
                _sort_order = -1;
                _g = _gamepad_count - 1;
            }

            #region Gamepad not in-use but potentially available
                        
            repeat(_gamepad_count)
            {
                if (gamepad_is_connected(_g) && input_source_is_available(INPUT_GAMEPAD[_g]))
                { 
                    //Check buttons
                    if (input_gamepad_check_pressed(_g, gp_face1)
                    ||  input_gamepad_check_pressed(_g, gp_face2)
                    ||  input_gamepad_check_pressed(_g, gp_face3)
                    ||  input_gamepad_check_pressed(_g, gp_face4)
                    ||  input_gamepad_check_pressed(_g, gp_shoulderl)
                    ||  input_gamepad_check_pressed(_g, gp_shoulderr)
                    ||  input_gamepad_check_pressed(_g, gp_start)
                    ||  input_gamepad_check_pressed(_g, gp_select)
                    ||  input_gamepad_check_pressed(_g, gp_stickl)
                    ||  input_gamepad_check_pressed(_g, gp_stickr)
                    ||  (input_gamepad_check_pressed(_g, gp_padu) && (input_gamepad_delta(_g, gp_padu) != 0))
                    ||  (input_gamepad_check_pressed(_g, gp_padd) && (input_gamepad_delta(_g, gp_padd) != 0))
                    ||  (input_gamepad_check_pressed(_g, gp_padl) && (input_gamepad_delta(_g, gp_padl) != 0))
                    ||  (input_gamepad_check_pressed(_g, gp_padr) && (input_gamepad_delta(_g, gp_padr) != 0))
                    ||  (!input_gamepad_is_axis(_g, gp_shoulderlb) && input_gamepad_check_pressed(_g, gp_shoulderlb))
                    ||  (!input_gamepad_is_axis(_g, gp_shoulderrb) && input_gamepad_check_pressed(_g, gp_shoulderrb)))
                    {
                            if (__INPUT_DEBUG_SOURCES) __input_trace("Hotswapping player 0 to ", INPUT_GAMEPAD[_g]);
                            return INPUT_GAMEPAD[_g];
                    }
                    
                    //Check axes
                    if  (INPUT_HOTSWAP_ON_GAMEPAD_AXIS)
                    {
                        if (((abs(input_gamepad_value(_g, gp_shoulderlb)) > input_axis_threshold_get(gp_shoulderlb).mini) && (abs(input_gamepad_delta(_g, gp_shoulderlb)) > __INPUT_DELTA_HOTSWAP_THRESHOLD))
                        ||  ((abs(input_gamepad_value(_g, gp_shoulderrb)) > input_axis_threshold_get(gp_shoulderrb).mini) && (abs(input_gamepad_delta(_g, gp_shoulderrb)) > __INPUT_DELTA_HOTSWAP_THRESHOLD))
                        ||  ((abs(input_gamepad_value(_g, gp_axislv    )) > input_axis_threshold_get(gp_axislv    ).mini) && (abs(input_gamepad_delta(_g, gp_axislv    )) > __INPUT_DELTA_HOTSWAP_THRESHOLD))
                        ||  ((abs(input_gamepad_value(_g, gp_axislh    )) > input_axis_threshold_get(gp_axislh    ).mini) && (abs(input_gamepad_delta(_g, gp_axislh    )) > __INPUT_DELTA_HOTSWAP_THRESHOLD))
                        ||  ((abs(input_gamepad_value(_g, gp_axislv    )) > input_axis_threshold_get(gp_axislv    ).mini) && (abs(input_gamepad_delta(_g, gp_axislv    )) > __INPUT_DELTA_HOTSWAP_THRESHOLD))
                        ||  ((abs(input_gamepad_value(_g, gp_axisrh    )) > input_axis_threshold_get(gp_axisrh    ).mini) && (abs(input_gamepad_delta(_g, gp_axisrh    )) > __INPUT_DELTA_HOTSWAP_THRESHOLD))
                        ||  ((abs(input_gamepad_value(_g, gp_axisrv    )) > input_axis_threshold_get(gp_axisrv    ).mini) && (abs(input_gamepad_delta(_g, gp_axisrv    )) > __INPUT_DELTA_HOTSWAP_THRESHOLD)))
                        {
                            if (__INPUT_DEBUG_SOURCES) __input_trace("Hotswapping player 0 to ", INPUT_GAMEPAD[_g]);
                            return INPUT_GAMEPAD[_g];
                        }
                    }
                    
                    //Check extended
                    if (INPUT_SDL2_ALLOW_EXTENDED)
                    {
                        if (input_gamepad_check_pressed(_g, gp_guide)
                        ||  input_gamepad_check_pressed(_g, gp_misc1)
                        ||  input_gamepad_check_pressed(_g, gp_touchpad)
                        ||  input_gamepad_check_pressed(_g, gp_paddle1)
                        ||  input_gamepad_check_pressed(_g, gp_paddle2)
                        ||  input_gamepad_check_pressed(_g, gp_paddle3)
                        ||  input_gamepad_check_pressed(_g, gp_paddle4))
                        {
                            if (__INPUT_DEBUG_SOURCES) __input_trace("Hotswapping player 0 to ", INPUT_GAMEPAD[_g]);
                            return INPUT_GAMEPAD[_g];
                        }
                    }
                }
            
                _g += _sort_order;
            }
                
            #endregion
        }
    }
    
    if (_global.__any_keyboard_binding_defined
    &&  input_source_is_available(INPUT_KEYBOARD)
    &&  keyboard_check(vk_anykey)
    &&  !__input_key_is_ignored(__input_keyboard_key())) //Ensure that this key isn't one we're trying to ignore
    {
        if (__INPUT_DEBUG_SOURCES) __input_trace("Hotswapping player 0 to ", INPUT_KEYBOARD);
        return INPUT_KEYBOARD;
    }
    
    if (!INPUT_TOUCHSCREEN_USES_MOUSE_SOURCE && __INPUT_TOUCH_PRIMARY)
    {
        if (input_source_is_available(INPUT_TOUCH) && device_mouse_check_button(_global.__pointer_index, mb_left))
        {
            if (__INPUT_DEBUG_SOURCES) __input_trace("Hotswapping player 0 to ", INPUT_TOUCH);
            return INPUT_TOUCH;
        }
    }
    else
    {
        if (input_source_is_available(INPUT_MOUSE)
        && ((INPUT_HOTSWAP_ON_MOUSE_MOVEMENT && _global.__pointer_moved)
          || INPUT_HOTSWAP_ON_MOUSE_BUTTON && (input_mouse_check(mb_any) || mouse_wheel_up() || mouse_wheel_down())))
        {
            if (__INPUT_DEBUG_SOURCES) __input_trace("Hotswapping player 0 to ", INPUT_MOUSE);
            return INPUT_MOUSE;
        }
    }
    
    return undefined;
}
