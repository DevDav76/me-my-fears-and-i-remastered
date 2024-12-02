dir = 0;
hSpeed = 0;
vSpeed = 0;
walkSpeed = 0.5;

stepped = false;

rechargeTime = 0;

flashlightOn = false;
flashlightMax = 300;
flashlightPercent = 100;
flashlight = flashlightMax;

hpMax = 20;
hp = hpMax;
hpPercent = 100;
blood = 0;
hitCooldown = 0;

image_xscale = 1;

application_surface_draw_enable(false);

var camera = view_get_camera(0);
var cam_width = camera_get_view_width(camera);
var cam_height = camera_get_view_height(camera);

light_surface = surface_create(cam_width,cam_height);

instance_create_layer(x,y,"Instances",objFlashlight);

do {
	x = irandom_range(0,room_width);
	y = irandom_range(0,room_height);
} until (!place_meeting(x,y,objCollision));

dead = false;
gameOver = 0;
gameOverF = 0;
instance_create_depth(0,0,-999,objStatic);

staticLevel = 0;

tutorialMsg = "WASD to move. Aim flashlight with your mouse, and use left click to toggle. Vaporize the ghosts with your flashlight, but mind your limited battery and recharge it by standing still."; 
tutorial = 900;

inHold = false;

audio_play_sound(mscSong,50,true);