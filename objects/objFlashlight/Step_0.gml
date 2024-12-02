x = objPlayer.x;
y = objPlayer.y-8;

direction = point_direction(objPlayer.x,objPlayer.y-8,mouse_x,mouse_y);
image_angle = direction;

image_xscale = 0.95+(0.05*global.lightLevel);
image_yscale = 0.95+(0.05*global.lightLevel);