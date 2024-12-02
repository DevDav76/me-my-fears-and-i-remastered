image_speed = 0;
image_index = 0;
image_alpha = 0;
direction = irandom_range(0,360);
if (direction > 90) and (direction < 270) image_xscale = -1;
if (direction < 90) or (direction > 270) image_xscale = 1;
speed = 1;

state = "chasing";
hp = 1;

jumpscared = 0;

footsteps = audio_play_sound(sndFootsteps,100,true);
