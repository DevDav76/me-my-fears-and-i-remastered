floatv = 0;
floath = 0;
i = 0;
radarLength = 60;

image_yscale = 1.5;
image_speed = 0;
image_index = 0;
image_alpha = 0;
direction = irandom_range(0,360);
if (direction > 90) and (direction < 270) image_xscale = -1.5;
if (direction < 90) or (direction > 270) image_xscale = 1.5;
speed = 0.4;

alarm[0] = irandom_range(15,100);

state = "looking";
hp = 250;