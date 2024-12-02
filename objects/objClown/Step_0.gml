depth = -y;

switch (state) {
	case ("chasing"):
		direction = point_direction(x,y,objPlayer.x,objPlayer.y);
		speed = 1.5;
		image_speed = 1;
		if (direction > 90) and (direction < 270) image_xscale = -1;
		if (direction < 90) or (direction > 270) image_xscale = 1;
		
		image_alpha = min(1,image_alpha+0.05);
	break;
	case ("dying"):
		sprite_index = sprClownHurt;
		speed = 0;
		image_index = 0;
		image_speed = 0;
		if (!place_meeting(x,y,objFlashlight)) or (!objPlayer.flashlightOn) state = "chasing";
		hp--;
		if (hp<1) {
			audio_sound_gain(footsteps,0,300);
			audio_play_sound(sndClownDeath,100,false);
			state = "dead";	
		}
	break;
	case ("dead"):
		image_index = 0;
		image_speed = 0;
		speed = 0;
		y -= 0.2;
		image_alpha = max(0,image_alpha-0.02);
		if (image_alpha==0) {
			repeat (15) {
				instance_create_layer(x,y,"Instances",objOrb);
			}
			objPlayer.hp = min(objPlayer.hpMax,objPlayer.hp+5);
			instance_destroy();
		}
	break;
	case ("killed"):
		speed = 0;
		image_alpha = max(image_alpha-0.1,0);
		if (jumpscared>=100) {
			instance_destroy();
		}
		jumpscared += 2;
	break;
}

if (state=="chasing" or state=="looking") {
	if (place_meeting(x,y,objFlashlight) and (objPlayer.flashlightOn)) {
		state = "dying";	
	}
}

if (place_meeting(x,y,objPlayer)) and (state!="dead") and (state!="killed") and (objPlayer.hitCooldown==0) {
	objPlayer.hp = max(0,objPlayer.hp-10);
	objPlayer.hitCooldown = 90;
	scrScreenshake(20,60);
	var _sound = choose(sndHurt1,sndHurt2,sndHurt3);
	audio_play_sound(_sound,100,false);
	audio_play_sound(sndClownKill,100,false);
	audio_sound_gain(footsteps,0,300);
	state = "killed";
}

