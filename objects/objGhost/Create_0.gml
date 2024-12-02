floatv = 0;
floath = 0;
i = 0;
radarLength = 60;

image_speed = 0;
image_index = 0;
image_alpha = 0;
direction = irandom_range(0,360);
if (direction > 90) and (direction < 270) image_xscale = -1;
if (direction < 90) or (direction > 270) image_xscale = 1;
speed = 0.1;

alarm[0] = irandom_range(30,300);

state = "looking";
hp = 100;

if (global.wave == 1) {
	//
} else if (global.wave > 1) and (global.wave < 4) {
	if (irandom_range(1,8)==1){
		instance_create_layer(x,y,"Instances",objClown);
		instance_destroy();
	}
} else if (global.wave > 3) and (global.wave < 6) {
	if (irandom_range(1,5)==1){
		instance_create_layer(x,y,"Instances",objClown);
		instance_destroy();
	}
	if (irandom_range(1,15)==1) {
		instance_create_layer(x,y,"Instances",objGoul);
		instance_destroy();
	}
} else if (global.wave > 5) and (global.wave < 9) {
	if (irandom_range(1,5)==1){
		instance_create_layer(x,y,"Instances",objClown);
		instance_destroy();
	}
	if (irandom_range(1,25)==1) {
		instance_create_layer(x,y,"Instances",objAlien);
		instance_destroy();
	}
	if (irandom_range(1,10)==1) {
		instance_create_layer(x,y,"Instances",objGoul);
		instance_destroy();
	}
} else if (global.wave > 8) and (global.wave < 11) {
	if (irandom_range(1,5)==1){
		instance_create_layer(x,y,"Instances",objClown);
		instance_destroy();
	}
	if (irandom_range(1,20)==1){
		instance_create_layer(x,y,"Instances",objAlien);
		instance_destroy();
	}
	if (irandom_range(1,40)==1){
		instance_create_layer(x,y,"Instances",objBoogeyman);
		instance_destroy();
	}
	if (irandom_range(1,5)==1) {
		instance_create_layer(x,y,"Instances",objGoul);
		instance_destroy();
	}
} else if (global.wave > 10) {
	if (irandom_range(1,5)==1){
		instance_create_layer(x,y,"Instances",objClown);
		instance_destroy();
	}
	if (irandom_range(1,15)==1){
		instance_create_layer(x,y,"Instances",objAlien);
		instance_destroy();
	}
	if (irandom_range(1,35)==1){
		instance_create_layer(x,y,"Instances",objBoogeyman);
		instance_destroy();
	}
	if (irandom_range(1,2)==1) {
		instance_create_layer(x,y,"Instances",objGoul);
		instance_destroy();
	}
}