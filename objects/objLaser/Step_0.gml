if (place_meeting(x,y,objCollision)) or
(!point_in_rectangle(x,y,
objPlayer.x-320,objPlayer.y-180,
objPlayer.x+320,objPlayer.y+180)) {
	instance_destroy();
}

if (place_meeting(x,y,objPlayer)) and (objPlayer.hitCooldown==0) {
	objPlayer.hp = max(0,objPlayer.hp-3);
	objPlayer.hitCooldown = 180;
	scrScreenshake(5,30);
	instance_destroy();
}