if (goTo != room) {
	image_alpha = min(1,image_alpha+0.02);
	if (image_alpha == 1) room_goto(goTo);
} else if (goTo == room) {
	image_alpha = max(0,image_alpha-0.02);
	if (image_alpha == 0) instance_destroy();
}