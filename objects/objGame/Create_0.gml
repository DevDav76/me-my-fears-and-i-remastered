var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);

audio_play_sound(mscMenu,100,true);

randomise();

global.highscore = 1;