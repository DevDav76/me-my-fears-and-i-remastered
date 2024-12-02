if (hpPercent<50) {
	draw_sprite_ext(sprRed,0,160,90,1.2+sin(blood)/15,1.2+sin(blood)/15,0,c_white,(1-(0.02*hpPercent)));
}

var _bottom = camera_get_view_height(view_get_camera(0)); //bottom of screen

if (!dead) {
	draw_set_alpha(1);
	draw_set_color(#1c1c1c)
	draw_rectangle(17,170,65,141,false);

	if (flashlightPercent>50) {
		draw_set_color(c_lime);
	} else if (flashlightPercent>25) {
		draw_set_color(c_yellow);	
	} else if (flashlightPercent>10) {
		draw_set_color(c_orange);	
	} else {
		draw_set_color(c_red);	
	}

	draw_rectangle(19,_bottom-13,27,_bottom-(13+ceil(flashlightPercent/4.34782)),false);

	draw_set_color(#FA021F);

	draw_rectangle(39,_bottom-12,63,_bottom-(12+ceil(hpPercent/4)),false);

	draw_set_color(c_white);

	draw_sprite(sprUI,0,8,_bottom-8);

	draw_set_font(fntFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);

	draw_set_alpha(min(100,tutorial)/100);
	draw_sprite(sprPaper,1,70,120);
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext_transformed(97,155,tutorialMsg,30,800,0.25,0.25,0);
	draw_set_alpha(1);
	draw_set_color(c_white);

} else if (dead) {
	draw_sprite_ext(sprGameOver,0,8,_bottom,2.7,2.7,0,c_white,gameOver);
	
	draw_set_alpha(gameOver);
	
	draw_set_color(c_white);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_top);
	draw_text_transformed(225,30,"Score: "+string(global.wave)+"\nHighscore: "+string(global.highscore),0.5,0.5,0);
	
	if (objUpgrades.highscoreBroken) {
		draw_set_color(#fcba03);
		draw_text_transformed(225,75,"New Highscore!!!",0.65+sin(gameOverF)/15,0.65+sin(gameOverF)/15,0);
		draw_set_color(c_white);
	}
	
	draw_text_transformed(225,140,"Press R to try again",0.5,0.5,0);
	
	draw_set_alpha(1);
}

tutorial = max(0,tutorial-1);