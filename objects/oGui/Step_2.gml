/// @description Insert description here
// You can write your code in this editor
if (room = rInicio) {
    if (keyboard_check_pressed(vk_up)) {
        if (global.selected == 0) {
            global.selected = array_length(menu_options) - 1;
        } else global.selected -= 1
    }
    if (keyboard_check_pressed(vk_down)) {
        if (global.selected < array_length(menu_options) - 1) {
            global.selected += 1;
        } else global.selected = 0
    }
}

if (room = Room1 and global.upgrade==1) {
    if (keyboard_check_pressed(vk_up)) {
        if (global.selected == 0) {
            global.selected = array_length(global.upgrade_options) - 1;
        } else global.selected -= 1
    }
    if (keyboard_check_pressed(vk_down)) {
        if (global.selected < array_length(global.upgrade_options) - 1) {
            global.selected += 1;
        } else global.selected = 0
    }
}


