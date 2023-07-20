//feather disable all

/**
 * Function Description
 * @param {string} _verb Description
 * @param {real} [_player_index]=0 Description
 * @param {real} [_buffer_duration]=0 Description
 */
function input_check_pressed(_verb, _player_index = 0, _buffer_duration = 0)
{
    __INPUT_GLOBAL_STATIC_LOCAL  //Set static _global
    __INPUT_VERIFY_PLAYER_INDEX
    
    if (_verb == all)
    {
        return input_check_pressed(_global.__basic_verb_array, _player_index, _buffer_duration);
    }
    
    if (is_array(_verb))
    {
        var _i = 0;
        repeat(array_length(_verb))
        {
            if (input_check_pressed(_verb[_i], _player_index, _buffer_duration)) return true;
            ++_i;
        }
        
        return false;
    }
    
    __INPUT_GET_VERB_STRUCT
    
    if (_verb_struct.__inactive) return false;
    
    if (_buffer_duration <= 0)
    {
        return ((_global.__cleared)? false : _verb_struct.press);
    }
    else
    {
        return ((_verb_struct.press_time >= 0) && ((__input_get_time() - _verb_struct.press_time) <= _buffer_duration));
    }
}
