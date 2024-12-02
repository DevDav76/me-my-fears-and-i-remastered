if (waveSlide>=0) and (waveSlide<=200) {
	draw_set_font(fntFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text_ext_color(160,70,"Wave "+string(global.wave),5,300,c_white,c_white,c_white,c_white,waveSlide/100);
}

if (fadeIn) {
	waveSlide++;
	if (waveSlide>=200) fadeIn = false;
} else if (!fadeIn) {
	waveSlide--;
}

//inventory
if (array_length(global.inventory)>0) {
	var _i = 0;
	repeat (array_length(global.inventory)) {
		if (array_get(global.inventory,_i)=="Flash Bomb") {
			draw_sprite(sprInventory,1,8,126-(_i*15));
		}
		if (array_get(global.inventory,_i)=="Med-kit") {
			draw_sprite(sprInventory,3,8,126-(_i*15));
		}
		if (array_get(global.inventory,_i)=="Battery Pack") {
			draw_sprite(sprInventory,2,8,126-(_i*15));
		}
		if (_i==selected) {
			draw_sprite(sprInventory,0,8,126-(_i*15));
		}
		_i++;
	}
}

if (menuOpen) {
	//vars
	var _buttonW = 34;
	var _buttonH = 33;
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);
	var _buttonX;
	var _buttonY;
	var _buttonIndex;
	var _cost;
	var _mouse = mouse_check_button_released(mb_left);
	var _desc = "";
	
	//backdrop
	draw_set_alpha(0.7);
	draw_sprite(sprUpgrades,0,32,26);
	draw_set_alpha(1);
	
	//health
	//originally 65,35
	_buttonX = 62;
	_buttonY = 36;
	_cost = 5*(power(2,global.hpLevel));
	
	if (global.hpLevel==10) {
		_buttonIndex = 3;
	} else {
		if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) {
			_buttonIndex = 2;
			_desc = "* Increases your maximum health.";
			if (_mouse) and (global.orbs>=_cost) {
				global.orbs -= _cost;
				global.hpLevel++;
				audio_play_sound(sndUpgrade,100,false);
			}
			_desc = "Health Upgrade\nLevel: "+string(global.hpLevel)+"/10 \nCosts: "+string(_cost)+" dream orbs\n"+_desc;	
		} else _buttonIndex = 1;
		if (global.orbs<_cost) _buttonIndex = 4;
	}
	draw_sprite(sprUpgrades,0+_buttonIndex,_buttonX,_buttonY);
	if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) and (global.hpLevel==10) {
		_desc = "Health Upgrade\n* Fully upgraded!";	
	}
	
	//battery
	_buttonX = 71;
	_buttonY = 69;
	_cost = 5*(power(2,global.batteryLevel));
	
	if (global.batteryLevel==10) {
		_buttonIndex = 3;
	} else {
		if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) {
			_buttonIndex = 2;
			_desc = "* Increases your maximum flashlight battery and how fast it can recharge.";
			if (_mouse) and (global.orbs>=_cost) {
				global.orbs -= _cost;
				global.batteryLevel++;
				audio_play_sound(sndUpgrade,100,false);
			}
			_desc = "Battery Upgrade\nLevel: "+string(global.batteryLevel)+"/10 \nCosts: "+string(_cost)+" dream orbs\n"+_desc;
		} else _buttonIndex = 1;
		if (global.orbs<_cost) _buttonIndex = 4;
	}
	draw_sprite(sprUpgrades,4+_buttonIndex,_buttonX,_buttonY);
	if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) and (global.batteryLevel==10) {
		_desc = "Battery Upgrade\n* Fully upgraded!";	
	}
	
	//speed
	_buttonX = 45;
	_buttonY = 96;
	_cost = 5*(power(2,global.speedLevel));
	
	if (global.speedLevel==10) {
		_buttonIndex = 3;
	} else {
		if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) {
			_buttonIndex = 2;
			_desc = "* Increases your maximum walking speed.";
			if (_mouse) and (global.orbs>=_cost) {
				global.orbs -= _cost;
				global.speedLevel++;
				audio_play_sound(sndUpgrade,100,false);
			}
			_desc = "Speed Upgrade\nLevel: "+string(global.speedLevel)+"/10 \nCosts: "+string(_cost)+" dream orbs\n"+_desc;	
		} else _buttonIndex = 1;
		if (global.orbs<_cost) _buttonIndex = 4;
	}
	draw_sprite(sprUpgrades,8+_buttonIndex,_buttonX,_buttonY);
	if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) and (global.speedLevel==10) {
		_desc = "Speed Upgrade\n* Fully upgraded!";	
	}
	
	//flashlight
	_buttonX = 106;
	_buttonY = 53;
	_cost = 5*(power(2,global.lightLevel));
	
	if (global.lightLevel==10) {
		_buttonIndex = 3;
	} else {
		if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) {
			_buttonIndex = 2;
			_desc = "* Increases your flashlight's damage and size.";
			if (_mouse) and (global.orbs>=_cost) {
				global.orbs -= _cost;
				global.lightLevel++;
				audio_play_sound(sndUpgrade,100,false);
			}
			_desc = "Flashlight Upgrade\nLevel: "+string(global.lightLevel)+"/10 \nCosts: "+string(_cost)+" dream orbs\n"+_desc;	
		} else _buttonIndex = 1;
		if (global.orbs<_cost) _buttonIndex = 4;
	}
	draw_sprite(sprUpgrades,15+_buttonIndex,_buttonX,_buttonY);
	if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) and (global.lightLevel==10) {
		_desc = "Flashlight Upgrade\n* Fully upgraded!";	
	}
	
	//flash bomb
	_buttonX = 100;
	_buttonY = 90;
	_cost = 150;
	
	if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) {
		_buttonIndex = 2;
		_desc = "* A one-time use item that evaporates all nearby monsters in an explosion of light.";
		if (_mouse) and (global.orbs>=_cost) and (array_length(global.inventory)<8) {
			global.orbs -= _cost;
			array_push(global.inventory,"Flash Bomb");
			audio_play_sound(sndUpgrade,100,false);
		}
		var _numInInv = 0;
		
		for (var i = 0; i<array_length(global.inventory); i++) {
			if (array_get(global.inventory,i)=="Flash Bomb") _numInInv++;
		}
		
		_desc = "Flash Bomb\nNumber in inventory: "+string(_numInInv)+"\nCosts: "+string(_cost)+" dream orbs\n"+_desc;	
	} else _buttonIndex = 1;
	if (global.orbs<_cost) or (array_length(global.inventory)>=8) _buttonIndex = 3;
	draw_sprite(sprUpgrades,19+_buttonIndex,_buttonX,_buttonY);
	
	//battery
	_buttonX = 137;
	_buttonY = 87;
	_cost = 50;
	
	if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) {
		_buttonIndex = 2;
		_desc = "* A one-time use item that completely restores your flashlight battery.";
		if (_mouse) and (global.orbs>=_cost) and (array_length(global.inventory)<8) {
			global.orbs -= _cost;
			array_push(global.inventory,"Battery Pack");
			audio_play_sound(sndUpgrade,100,false);
		}
		var _numInInv = 0;
		
		for (var i = 0; i<array_length(global.inventory); i++) {
			if (array_get(global.inventory,i)=="Battery Pack") _numInInv++;
		}
		
		_desc = "Extra Battery Pack\nNumber in inventory: "+string(_numInInv)+"\nCosts: "+string(_cost)+" dream orbs\n"+_desc;	
	} else _buttonIndex = 1;
	if (global.orbs<_cost) or (array_length(global.inventory)>=8) _buttonIndex = 3;
	draw_sprite(sprUpgrades,22+_buttonIndex,_buttonX,_buttonY);
	
	//med-kit
	_buttonX = 143;
	_buttonY = 50;
	_cost = 50;
	
	if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) {
		_buttonIndex = 2;
		_desc = "* A one-time use item that completely restores your health and gives a quick burst of invincibility.";
		if (_mouse) and (global.orbs>=_cost) and (array_length(global.inventory)<8) {
			global.orbs -= _cost;
			array_push(global.inventory,"Med-kit");
			audio_play_sound(sndUpgrade,100,false);
		}
		var _numInInv = 0;
		
		for (var i = 0; i<array_length(global.inventory); i++) {
			if (array_get(global.inventory,i)=="Med-kit") _numInInv++;
		}
		
		_desc = "Med-kit\nNumber in inventory: "+string(_numInInv)+"\nCosts: "+string(_cost)+" dream orbs\n"+_desc;	
	} else _buttonIndex = 1;
	if (global.orbs<_cost) or (array_length(global.inventory)>=8) _buttonIndex = 3;
	draw_sprite(sprUpgrades,25+_buttonIndex,_buttonX,_buttonY);
	
	//magnet
	_buttonX = 75;
	_buttonY = 114;
	_cost = 200;
	
	if (global.magnet) {
		_buttonIndex = 3;
	} else {
		if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) {
			_buttonIndex = 2;
			_desc = "* A one-time purchase that permanently attracts all Dream Orbs to you.";
			if (_mouse) and (global.orbs>=_cost) {
				global.orbs -= _cost;
				global.magnet = true;
				audio_play_sound(sndUpgrade,100,false);
			}
			_desc = "Dream Orb Magnet\nCosts: "+string(_cost)+" dream orbs\n"+_desc;	
		} else _buttonIndex = 1;
		if (global.orbs<_cost) _buttonIndex = 4;
	}
	draw_sprite(sprUpgrades,28+_buttonIndex,_buttonX,_buttonY);
	if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) and (global.magnet) {
		_desc = "Dream Orb Magnet\n* Purchased!";	
	}
	
	//description
	draw_set_font(fntFont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	
	if (_desc!="") draw_text_ext_transformed(180,50,_desc,25,330,0.25,0.25,0);
	
	if (array_length(global.inventory)==8) draw_set_color(c_red);
	draw_text_ext_transformed(180,110,"Inventory capacity: "+string(array_length(global.inventory))+"/8",25,330,0.25,0.25,0);
	
	draw_set_color(c_white);
	
	//title and next wave button
	draw_sprite(sprUpgrades,13,113,10);
	
	_buttonX = 113;
	_buttonY = 124;
	_buttonW = 93;
	_buttonH = 38;
	if (point_in_rectangle(_mx,_my,_buttonX,_buttonY,_buttonX+_buttonW,_buttonY+_buttonH)) {
		draw_sprite(sprUpgrades,15,_buttonX,_buttonY);
		if (_mouse) {
			objPlayer.flashlight = objPlayer.flashlightMax;
			objPlayer.hp = min(objPlayer.hpMax,objPlayer.hp+ceil(objPlayer.hpMax/10));
			menuOpen = false;
			audio_play_sound(sndStart,100,false);
			global.wave++;	
		}
	} else draw_sprite(sprUpgrades,14,_buttonX,_buttonY);

/*
	var _cost;
	
	if (global.hpLevel<10) {
		_cost = 5*(power(2,global.hpLevel));
		
		draw_set_color(c_white);
		draw_text_transformed(133,79,"Lvl "+string(global.hpLevel),0.2,0.2,0);
		
		if (_cost>global.orbs) draw_set_color(#FA021F);
		draw_text_transformed(130,113,"Costs\n"+string(_cost),0.2,0.2,0);
		draw_set_color(c_white);
	} else {
		draw_set_color(#FA021F);
		draw_text_transformed(129,79,"Lvl MAX",0.2,0.2,0);	
	}
	if (global.batteryLevel<10) {
		_cost = 5*(power(2,global.batteryLevel));

		draw_set_color(c_white);
		draw_text_transformed(156,79,"Lvl "+string(global.batteryLevel),0.2,0.2,0);
		
		if (_cost>global.orbs) draw_set_color(#FA021F);
		draw_text_transformed(153,113,"Costs\n"+string(_cost),0.2,0.2,0);
		draw_set_color(c_white);
	} else {
		draw_set_color(#FA021F);
		draw_text_transformed(152,79,"Lvl MAX",0.2,0.2,0);
	}
	if (global.speedLevel<10) {
		_cost = 5*(power(2,global.speedLevel));
		
		draw_set_color(c_white);
		draw_text_transformed(177,79,"Lvl "+string(global.speedLevel),0.2,0.2,0);
		
		if (_cost>global.orbs) draw_set_color(#FA021F);
		draw_text_transformed(174,113,"Costs\n"+string(_cost),0.2,0.2,0);
		draw_set_color(c_white);
	} else {
		draw_set_color(#FA021F);
		draw_text_transformed(173,79,"Lvl MAX",0.2,0.2,0);
	}
}
*/
}

draw_set_font(fntFont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(6,2,"Dream Orbs: "+string(global.orbs),0.5,0.5,0);