speed += (0-speed)/5;

if (abs(x-objPlayer.x)<32) and (abs(y-objPlayer.y)<32) {
	collected = true;
}

if (!collected) and (global.magnet) and (alarm[0]==0) {
	collected = true;
}

if (objUpgrades.menuOpen) collected = true;

if (collected) {
	speed = 0;
	x += (objPlayer.x-x)/5;
	y += (objPlayer.y-y)/5;
	size -= 0.05;
	
	image_xscale = size;
	image_yscale = size;
	
	if (size<0) {
		global.orbs += 1;
		instance_destroy();
	}
}

if (despawning) {
	x += random_range(-0.2,0.2);
	y += random_range(-0.2,0.2);
}