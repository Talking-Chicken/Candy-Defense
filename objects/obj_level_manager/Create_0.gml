global.player_deck = ds_list_create();

global.level = 1;
//the wave of enemy to encounter before change level
global.current_wave = 0;
global.total_wave = 5;

global.current_health = 100;
global.total_health = 100;

global.dead = false;

draw_set_font(font0);
font_set_cache_size(font0,50);

audio_play_sound(bk,0,true);

created_health_dead = false;