if (place_meeting(x,y,objFlash)) and (state!="dead") {
	switch (object_index) {
		case (objGhost):
			audio_play_sound(sndGhostDeath,100,false);
		break;
		case (objGoul):
			audio_play_sound(sndGhostDeath,100,false);
		break;
		case (objClown):
			audio_play_sound(sndClownDeath,100,false);
		break;
		case (objAlien):
			audio_play_sound(sndAlienDeath,100,false);
		break;
		case (objBoogeyman):
			audio_play_sound(sndBoogeymanDeath,100,false);
		break;
	}
	state = "dead";
}

if (objPlayer.dead) {
	state = "dead";	
}

if (!point_in_rectangle(x,y,objPlayer.x-320,objPlayer.y-180,objPlayer.x+320,objPlayer.y+180)) {
	var _spawnx
	var _spawny
	do {	
	_spawnx = objPlayer.x+irandom_range(-200,200);
	_spawny = objPlayer.y+irandom_range(-130,130);
	} until (!point_in_rectangle(_spawnx,_spawny,objPlayer.x-190,objPlayer.y-120,objPlayer.x+190,objPlayer.y+120)) and (point_in_rectangle(_spawnx,_spawny,0,0,room_width,room_height));
	x = _spawnx;
	y = _spawny;
}