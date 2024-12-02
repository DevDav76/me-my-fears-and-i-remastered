speed = 2;
direction = point_direction(x,y,objPlayer.x,objPlayer.y);
image_angle = direction;

audio_play_sound(sndLaser,100,false);

depth = -99;