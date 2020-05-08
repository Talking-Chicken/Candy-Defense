if (level_room()) {
	draw_text(50,50,"wave"+string(global.current_wave));
	draw_text(50,100,"level"+string(global.level));
	draw_text(50,150,"deck num"+string(ds_list_size(global.player_deck)));
	
	//draw energy/max_energy
	draw_sprite(spr_energy, image_index, 65,830);
	draw_text(34,810,string(global.current_energy) + " / " + string(global.total_energy));

	//draw health
	draw_sprite(spr_health, image_index, room_width/2,64);
	draw_set_color($5268df);
	if (global.current_health >= 100) {
		draw_text(room_width/2-32,50,string(global.current_health));
	} else {
		draw_text(room_width/2-16,50,string(global.current_health));
	}
	draw_set_color(c_white);
}

if (room == room_end) {
	if (!created_health_dead) {
		instance_create_depth(room_width/2, room_height/2-200,-100,obj_health_dead);
		created_health_dead = true;
	}
	draw_text(room_width/2-75,room_height/2,"Game Over");
	draw_text(room_width/2-125, room_height/2 + 50, "level complete: " + string(global.level));
}