
//add outline
if (hover) {
	draw_set_color(c_white);
	draw_rectangle(x-2,y-2,x+sprite_width+2,y+sprite_width+2,false);
}

draw_self();