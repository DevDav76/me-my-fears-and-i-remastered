depth = -999;
size = random_range(0.8,1.2);
image_xscale = size;
image_yscale = size;
image_index = irandom_range(0,5);

collected = false;

direction = irandom_range(0,360);
speed = random_range(1,5);

if (global.magnet) alarm[0] = 60;

if (objPlayer.dead) instance_destroy();

despawning = false;
alarm[1] = 1500;