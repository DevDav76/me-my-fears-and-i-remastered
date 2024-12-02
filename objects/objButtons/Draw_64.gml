if (about) {
	draw_set_color(c_white);
	draw_sprite(sprPaper,0,0,0);
	
	draw_set_color(c_black);
	draw_set_font(fntFont);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_top);
	draw_text_ext_transformed(160,35,"Welcome to Me, My Fears, & I! In this game, you play as William, a young boy who seems to be scared of a lot of things. However, he is his own worst enemy because those fears of his come alive as nightmarish monsters through his dreams. Armed with only a flashlight, help William fight off the endless onslaught of frightening monsters from his living nightmare that attack him every time he sleeps.\n\nThis game was made by two highschoolers alone for the Counterspell Game Jam, hosted by Hack Club. This is the remastered version of the original game made in less than 24 hours.\n\nPress any key or click anywhere to continue.",23,550,0.24,0.24,0);
	
	if (keyboard_check_pressed(vk_anykey) or mouse_check_button_pressed(mb_left)) {
		audio_play_sound(sndPaper,100,false);
		about = false;	
	}
}