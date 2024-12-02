if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}

x += (xTo - x)/25;
y += (yTo - y)/25;

x += random_range(-shakeRemain,shakeRemain);
y += random_range(-shakeRemain,shakeRemain);

shakeRemain = max(0,shakeRemain-((1/shakeLength)*shakeMagnitude));

x = clamp(x,widthHalf,room_width-widthHalf);
y = clamp(y,heightHalf,room_height-heightHalf);

camera_set_view_pos(view_camera[0],x-(camWidth*0.5),y-(camHeight*0.5));