var camera = view_get_camera(0);

if (!surface_exists(self.light_surface)) {
	var cam_width = camera_get_view_width(camera);
	var cam_height = camera_get_view_height(camera);

	self.light_surface = surface_create(cam_width,cam_height);	
}

surface_set_target(self.light_surface);
draw_clear(#00001c);
camera_apply(camera);

gpu_set_blendmode(bm_subtract);

if (flashlightOn) {
	draw_sprite_ext(sprFlashlight,1,x,y-8,0.95+(0.05*global.lightLevel),0.95+(0.05*global.lightLevel),mouseAngle,c_white,1);
}

with (objOrb) {
	draw_sprite_ext(sprOrb,0,x,y,image_xscale*2,image_yscale*2,0,c_white,1);	
}

with (objFlash) {
	draw_self();	
}

with (objLaser) {
	draw_sprite_ext(sprOrb,0,x+lengthdir_x(speed,direction),y+lengthdir_y(speed,direction),2,2,0,c_white,1);	
	
	gpu_set_blendmode(bm_normal);
	draw_sprite_ext(sprOrb,0,x+lengthdir_x(speed,direction),y+lengthdir_y(speed,direction),2,2,0,c_red,1);
	gpu_set_blendmode(bm_subtract);
}

draw_sprite(sprLight,0,x,y-8);

gpu_set_blendmode(bm_normal);

surface_reset_target();