depth = -y;

switch (state) {
	case ("chasing"):
		direction = point_direction(x,y,objPlayer.x,objPlayer.y);
		speed = 0.7;
		image_speed = 1;
		if (direction > 90) and (direction < 270) image_xscale = -1;
		if (direction < 90) or (direction > 270) image_xscale = 1;
		
		image_alpha = min(1,image_alpha+0.05);
	break;
	case ("dead"):
		sprite_index = sprBoogeymanHurt;
		image_index = 0;
		image_speed = 0;
		speed = 0;
		y -= 0.2;
		image_alpha = max(0,image_alpha-0.02);
		if (image_alpha==0) {
			repeat (50) {
				instance_create_layer(x,y,"Instances",objOrb);
			}
			objPlayer.hp = min(objPlayer.hpMax,objPlayer.hp+15);
			instance_destroy();
		}
	break;
	case ("grabbed"):
		image_speed = 0;
		sprite_index = sprBoogeymanHold;
		speed = 0;
		if (image_xscale==1) {
			objPlayer.x = x + 15;
		} else {
			objPlayer.x = x - 15;
		}
		objPlayer.y = y - 17;
		objPlayer.hp = max(0,objPlayer.hp-0.03);
		scrScreenshake(1,1);
	break;
}

if (place_meeting(x,y,objPlayer)) and (state!="dead") and (state!="grabbed") and (objPlayer.hitCooldown==0) and (!objPlayer.inHold) {
	var _sound = choose(sndHurt1,sndHurt2,sndHurt3);
	audio_play_sound(_sound,100,false);
	state = "grabbed";
	audio_stop_sound(crawl);
	objPlayer.inHold = true;
	scrScreenshake(10,45);
}

if (place_meeting(x,y,objFlashlight) and (objPlayer.flashlightOn)) {
	hp -= 0.85+(0.15*global.lightLevel);
	if (hp<=0) and (state!="dead") {
		objPlayer.inHold = false;
		audio_stop_sound(crawl);
		audio_play_sound(sndBoogeymanDeath,100,false);
		state = "dead";	
	}
}