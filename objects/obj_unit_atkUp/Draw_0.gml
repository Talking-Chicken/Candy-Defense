/// @description Insert description here
event_inherited();

if (global.stage_current == global.stage_player_choose) {
	draw_set_alpha(0.3);
	draw_set_color($6e852e);
	draw_circle(x,y,range,false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}