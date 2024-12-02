if (lastWave!=global.wave) {
	lastWave = global.wave;
	if (global.wave>global.highscore) {
		global.highscore = global.wave;
		highscoreBroken = true;
	}
	
	waveSlide = 0;
	fadeIn = true;
	
	enemies = global.wave * 5;
	time = 1;
	alarm[0] = time*60;
	var _spawnx
	var _spawny
	do {
		_spawnx = objPlayer.x+irandom_range(-240,240);
		_spawny = objPlayer.y+irandom_range(-135,135);
	} until !((abs(_spawnx-objPlayer.x)<64) and (abs(_spawny-objPlayer.y)<64));
	instance_create_layer(_spawnx,
	_spawny,
	"Instances",
	objGhost);
	enemies--;
	//once per wave this happens
	
	//tips
	switch (global.wave) {
		case (2):
			objPlayer.tutorial = 700;
			objPlayer.tutorialMsg = "Using the Dream Orbs you collect, upgrade your stats and purchase items. Press Space to use your items and the scroll wheel or the arrows keys to choose between them.";
		break;
		case (3):
			objPlayer.tutorial = 700;
			objPlayer.tutorialMsg = "Monsters restore some health when defeated. Oh, and watch out for clowns... Clowns are fast, but vaporize from your light instantly. Listen out for their footsteps.";
		break;
		case (4):
			objPlayer.tutorial = 700;
			objPlayer.tutorialMsg = "Dream Orbs disappear after 30 seconds, so be sure to grab them, or buy the Dream Orb magnet. They are also all automatically collected when you finish a wave.";
		break;
		case (5):
			objPlayer.tutorial = 700;
			objPlayer.tutorialMsg = "Each stat can go up to a maximum level of 10, but the number of Dream Orbs required doubles after each upgrade.";
		break;
		case (6):
			objPlayer.tutorial = 700;
			objPlayer.tutorialMsg = "Watch out for aliens, and dodge their lasers. They corrupt your vision with static if they manage to get close.";
		break;
		case (7):
			objPlayer.tutorial = 700;
			objPlayer.tutorialMsg = "The lasers that aliens shoot can be blocked, try to avoid them by hiding behind trees.";
		break;
		case (8):
			objPlayer.tutorial = 700;
			objPlayer.tutorialMsg = "You are surviving well so far. If you can survive this next wave, you may just be ready for a new challenge.";
		break;
		case (9):
			objPlayer.tutorial = 700;
			objPlayer.tutorialMsg = "The boogeyman won't stop from light. Don't let it get near, because once it grabs you, your flashlight no longer charges.";
		break;
		case (10):
			objPlayer.tutorial = 700;
			objPlayer.tutorialMsg = "Congratulations on making it to Wave 10 in this endless nightmare.";
		break;
		case (11):
			objPlayer.tutorial = 700;
			objPlayer.tutorialMsg = "The forest isn't endless, and is actually only 1000 by 1000 pixels. So you can't run forever.";
		break;
		case (12):
			objPlayer.tutorial = 700;
			objPlayer.tutorialMsg = "Every wave, 5 more monsters spawn than the last. 60 will spawn this round.";
		break;
		case (13):
			objPlayer.tutorial = 700;
			objPlayer.tutorialMsg = "What's the highest wave you can make it to?";
		break;
	}
	if (global.wave>13) {
		objPlayer.tutorial = 0;
		objPlayer.tutorialMsg = "";	
	}
}

if (instance_number(objEnemy)==0) and (enemies==0) and (!objPlayer.dead) {
	menuOpen = true;	
}

keyUp = keyboard_check_pressed(vk_up) or mouse_wheel_up();
keyDown = keyboard_check_pressed(vk_down) or mouse_wheel_down();
keyUse = keyboard_check_pressed(vk_space);

if (array_length(global.inventory) > 1) {
	if (keyUp) {
		selected++;
		if (selected>array_length(global.inventory)-1) selected = 0;
	}
	if (keyDown) {
		selected--;
		if (selected<0) selected = array_length(global.inventory)-1;
	}
}
if (array_length(global.inventory) > 0) {
	if (keyUse) {
		if (array_get(global.inventory,selected)=="Flash Bomb") {
			instance_create_layer(objPlayer.x,objPlayer.y,"Instances",objFlash);	
		}
		if (array_get(global.inventory,selected)=="Med-kit") {
			audio_play_sound(sndUpgrade,100,false);
			objPlayer.hp = objPlayer.hpMax;	
			objPlayer.hitCooldown = 45;
		}
		if (array_get(global.inventory,selected)=="Battery Pack") {
			audio_play_sound(sndUpgrade,100,false);
			objPlayer.flashlight = objPlayer.flashlightMax;	
		}
		array_delete(global.inventory,selected,1);
		selected = 0;
	}
}

