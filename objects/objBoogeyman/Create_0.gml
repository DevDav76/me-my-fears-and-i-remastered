image_speed = 1;
image_index = 0;
image_alpha = 0;
direction = point_direction(x,y,objPlayer.x,objPlayer.y);
if (direction > 90) and (direction < 270) image_xscale = -1;
if (direction < 90) or (direction > 270) image_xscale = 1;
speed = 0.7;

state = "chasing";
hp = 600;

crawl = audio_play_sound(sndBoogeymanCrawl,100,true);