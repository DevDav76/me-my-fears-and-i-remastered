image_xscale = size;
image_yscale = size;

if (expanding) {
	size += (5-size)/15;
	if (size>4.9) expanding = false;
} else if (!expanding) {
	size += (0-size)/15;
	if (size<0.1) instance_destroy();
}