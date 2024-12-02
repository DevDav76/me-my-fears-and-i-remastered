if (state=="looking") {
	direction = point_direction(x,y,objPlayer.x,objPlayer.y);
	direction += irandom_range(-30,30);
	speed = choose(0,0.4);
	if (direction > 90) and (direction < 270) image_xscale = -1.5;
	if (direction < 90) or (direction > 270) image_xscale = 1.5;
}

alarm[0] = irandom_range(15,100);