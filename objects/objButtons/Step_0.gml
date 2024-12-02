click = mouse_check_button_released(mb_left);

if (!about) {
	if (button==0) {
		if (instance_position(mouse_x,mouse_y,self)) {
			image_index = 1;
			size += (1.05-size)/10;
			if (click) {
				instance_create_depth(0,0,-999,objFade,{
					goTo : rmGame	
				});
				audio_play_sound(sndStart,100,false);
			}
		} else {
			image_index = 0;
			size += (1-size)/10;
		}
	}

	if (button==1) {
		if (instance_position(mouse_x,mouse_y,self)) {
			image_index = 3;
			size += (1.05-size)/10;
			if (click) {
				about = true;
				audio_play_sound(sndPaper,100,false);
			}
		} else {
			image_index = 2;
			size += (1-size)/10;
		}
	}
}

image_xscale = size;
image_yscale = size;