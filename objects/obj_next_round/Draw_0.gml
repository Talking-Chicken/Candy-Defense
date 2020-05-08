draw_self();

if (position_meeting(mouse_x, mouse_y, id)) {
	draw_rectangle(x-1,y-1,x+sprite_width+1,y+sprite_height+1,true);
}

if (room == room_select) {
	draw_text(1302, 215, "BUY");
	draw_text(1302, 500, "REMOVE");
}