depth = -y;

switch (state) {
	case ("looking"):
		i += 0.1;
		floatv = sin(i);
		floath = 0;
		
		if (collision_line(x,y,x+lengthdir_x(radarLength,direction),y+lengthdir_y(radarLength,direction),objPlayer,false,true))
		or (abs(objPlayer.x-x)<radarLength/2 and abs(objPlayer.y-y)<radarLength/2)
		{
			state = "chasing";	
		}
		
		image_alpha = min(1,image_alpha+0.01);
	break;
	case ("chasing"):
		i += 0.3;
		floatv = sin(i);	
		floath = 0;
		direction = point_direction(x,y,objPlayer.x,objPlayer.y)+irandom_range(-5,5);
		speed = 1;
		if (direction > 90) and (direction < 270) image_xscale = -1.5;
		if (direction < 90) or (direction > 270) image_xscale = 1.5;
		
		image_alpha = min(1,image_alpha+0.01);
	break;
	case ("dying"):
		floatv = random_range(-1,1);
		floath = random_range(-1,1);
		speed = 0;
		image_index = 1;
		if (!place_meeting(x,y,objFlashlight)) or (!objPlayer.flashlightOn) state = "chasing";
		hp -= 0.85+(0.15*global.lightLevel);
		if (hp<1) {
			audio_play_sound(sndGhostDeath,100,false);
			state = "dead";	
		}
	break;
	case ("dead"):
		image_index = 1;
		speed = 0;
		floatv = 0;
		floath = 0;
		y -= 0.2;
		image_alpha = max(0,image_alpha-0.02);
		if (image_alpha==0) {
			repeat (10) {
				instance_create_layer(x,y,"Instances",objOrb);
			}
			objPlayer.hp = min(objPlayer.hpMax,objPlayer.hp+2);
			instance_destroy();
		}
	break;
	case ("killed"):
		depth = -999;
		image_index = 2;
		speed = 0;
		floatv = 0;
		floath = 0;
		if (image_xscale>0) image_xscale += 0.05;
		if (image_xscale<0) image_xscale -= 0.05;
		image_yscale += 0.05;
		image_alpha = max(0,image_alpha-0.01);
		if (image_alpha==0) instance_destroy();
	break;
}

if (state=="chasing" or state=="looking") {
	image_index = 0;
	if (place_meeting(x,y,objFlashlight) and (objPlayer.flashlightOn)) {
		state = "dying";	
	}
}

if (place_meeting(x,y,objPlayer)) and (state!="dead") and (state!="killed") and (objPlayer.hitCooldown==0) {
	objPlayer.hp = max(0,objPlayer.hp-15);
	objPlayer.hitCooldown = 90;
	scrScreenshake(5,30);
	var _sound = choose(sndHurt1,sndHurt2,sndHurt3);
	audio_play_sound(_sound,100,false);
	audio_play_sound(sndSeen,100,false);
	state = "killed";
}

