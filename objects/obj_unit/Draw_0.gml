
draw_self();

if (global.stage_current == global.stage_player_choose) {
	draw_set_alpha(0.5);
	draw_circle(x,y,range,true);
	draw_set_alpha(1);
}