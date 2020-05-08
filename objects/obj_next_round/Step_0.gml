//esc exit full screen, affecting all time
if (keyboard_check(vk_escape)) {
	window_set_fullscreen(false);
} if (keyboard_check(ord("F"))) {
	window_set_fullscreen(true);
}

if (keyboard_check(ord("R"))) {
	game_restart();
}

if (room != room_select) {
	global.removed = false;
}

