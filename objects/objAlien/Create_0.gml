floatv = 0;
floath = 0;
i = 0;
radarLength = 100;

image_speed = 0;
image_index = 0;
image_alpha = 0;
direction = irandom_range(0,360);
if (direction > 90) and (direction < 270) image_xscale = -1;
if (direction < 90) or (direction > 270) image_xscale = 1;
speed = 0.1;

alarm[0] = irandom_range(30,300);

state = "looking";
hp = 500;

alarm[1] = 60;