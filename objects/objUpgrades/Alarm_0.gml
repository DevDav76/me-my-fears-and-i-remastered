if (enemies>0) {
	alarm[0] = time*60;
	
	if (!objPlayer.dead) {
		var _spawnx
		var _spawny
		do {
		_spawnx = objPlayer.x+irandom_range(-200,200);
		_spawny = objPlayer.y+irandom_range(-130,130);
		} until (!((abs(_spawnx-objPlayer.x)<128) and (abs(_spawny-objPlayer.y)<128))) and (point_in_rectangle(_spawnx,_spawny,0,0,room_width,room_height));
		instance_create_layer(_spawnx,
		_spawny,
		"Instances",
		objGhost);
	}
	
	enemies--;
}