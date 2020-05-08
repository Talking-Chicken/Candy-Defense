if (room == room_intro) {
	if (keyboard_check(ord(" "))) {
		room_goto(room0);
	}
}

if (room != room_select) {
	if (global.current_wave == global.total_wave) {
		room_goto(room_select);
		global.current_wave = 0;
		global.level++
		global.difficulty = 0;
	}
}

if (global.current_health <= 0 && room != room_end) {
	room_goto(room_end);
}

if (room == room_end) {
	if (keyboard_check(ord(" ")) || keyboard_check(vk_escape)) {
		game_end();
	}
}



