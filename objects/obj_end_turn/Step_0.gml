if (global.stage_current == global.stage_player_choose) {
	// if hover over with mouse, add a outline
	if (position_meeting(mouse_x,mouse_y,self)) {
		hover = true;
		if (mouse_check_button(mb_left)) {
			global.stage_current = global.stage_player_units_moving;
			hover = false;
			obj_card_dealer.timer = obj_card_dealer.reset_timer;
			if (sprite_index == spr_end_turn) {
				sprite_index = spr_end_turn_clicked;
			}
		}
	} else if (hover = true) {
		hover = false;
	}
}
