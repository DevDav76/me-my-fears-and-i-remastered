if (room==rmMenu) {
	draw_sprite(sprMouse,mouse_check_button(mb_left),mouse_x,mouse_y);
} else {
	if (instance_exists(objUpgrades)) {
			if (objUpgrades.menuOpen) draw_sprite(sprMouse,mouse_check_button(mb_left),device_mouse_x_to_gui(0),device_mouse_y_to_gui(0));
	}
	if (objPlayer.dead) {
		draw_sprite(sprMouse,mouse_check_button(mb_left),device_mouse_x_to_gui(0),device_mouse_y_to_gui(0));	
	}
}