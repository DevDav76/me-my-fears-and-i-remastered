menuOpen = false;
selected = 0;
global.orbs = 0;

highscoreBroken = false;

global.hpLevel = 1;
global.batteryLevel = 1;
global.speedLevel = 1;
global.lightLevel = 1;
global.inventory = [];
global.magnet = false;

global.wave = 1;
waveSlide = 0;
fadeIn = true;
lastWave = global.wave;

enemies = global.wave * 5;
time = 1;
alarm[0] = time*60;

var _spawnx
var _spawny
do {
	_spawnx = objPlayer.x+irandom_range(-200,200);
	_spawny = objPlayer.y+irandom_range(-130,130);
} until (!((abs(_spawnx-objPlayer.x)<128) and (abs(_spawny-objPlayer.y)<128))) and (point_in_rectangle(_spawnx,_spawny,0,0,room_width,room_height));
instance_create_layer(_spawnx,
_spawny,
"Instances",
objGhost);

enemies--;