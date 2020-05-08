
switch global.stage_current {
	case global.stage_deal:
		if (timer > 0) {
			timer--;
		} else {
			//set all status back
			global.current_enemy_num = 0;
			global.current_energy = global.total_energy;
			
			//shuffle the deck after cards back from sidcard pile
			if (ds_list_empty(discard_pile)) {
				ds_list_shuffle(deck);
				for (var i = 0; i < ds_list_size(deck); i++) {
					var card_to_shuffle = deck[| i];
					card_to_shuffle.target_depth = -i;
				}
			}
			
			if (ds_list_size(hand) < global.total_hand_size && !ds_list_empty(deck)) {
				var card = deck[| ds_list_size(deck)-1];
				card.target_x =  player_hand_x - (global.total_hand_size/2)*(card.sprite_width+gap) + global.current_hand_size*(card.sprite_width+gap);
				card.target_y = player_hand_y;
				card.inhand = true;
				card.face_up = true;
				ds_list_add(hand, card);
				ds_list_delete(deck, ds_list_size(deck)-1);
				timer = reset_timer;
			} else {
				global.stage_current = global.stage_player_choose;
			}
		}
	break;
	
	case global.stage_player_choose:
	if (timer > 0) {
		timer--;
	} else {
		//this part is in obj_card's step
		
	}
	
	break;
	
	case global.stage_player_units_moving:
		if (timer > 0) {
			timer--;
		} else {
			//first put all unsued card in discard pile
			if (!ds_list_empty(hand)) {
				for (var i = ds_list_size(hand)-1; i >= 0; i--) {
					var card = hand[| i];
					card.target_x = discard_pile_x;
					card.target_y = discard_pile_y;
					ds_list_add(discard_pile, card);
					ds_list_delete(hand, ds_list_size(hand)-1);
					card.target_depth = -ds_list_size(discard_pile);
				}
			}
			
			timer = reset_timer;
			global.stage_current = global.stage_enemy;
		}
	break;
	
	case global.stage_enemy:
		if (timer > 0) {
			timer--;
		} else {
			
		}
	break;
	
	case global.stage_enemy_units_moving:
		if (timer > 0) {
			timer--;
		} else {
			if (ds_list_empty(global.enemy_chess)) {
				//check how many card is discarded and sign the value to it
				global.discard_num = ds_list_size(discard_pile);
				//if deck is not enough, goto shuffling stage. else go back to dealing stage
				if (ds_list_size(deck) < global.total_hand_size && global.discard_num > 0) {
					global.stage_current = global.stage_shuffle;
					//difficulties and wave goes up
					global.difficulty += 3;
					global.total_enemy_num += global.difficulty;
					global.current_wave++;
				} else {
					global.stage_current = global.stage_deal;
					//difficulties and wave goes up
					global.difficulty += 3;
					global.total_enemy_num += global.difficulty;
					global.current_wave++;
				}
			} else {
				global.stage_current = global.stage_enemy;
				timer = reset_timer;
			}
		}
	break;
	
	case global.stage_shuffle:
		if (timer > 0) {
			timer--;
		} else {
			var card = discard_pile[| global.discard_num-1];
			card.target_x = deck_pos_x;
			card.target_y = deck_pos_y;
			ds_list_add(deck, card);
			ds_list_delete(discard_pile, global.discard_num-1);
			card.face_up = false;
			global.discard_num--;
			
			if (global.discard_num == 0 && ds_list_empty(discard_pile)) {
				global.stage_current = global.stage_deal;	
			}
			timer = reset_timer/4;
		}
	break;
}

global.current_hand_size = ds_list_size(hand);

if (!ds_list_empty(discard_pile)) {
	for (var i = 0; i < ds_list_size(discard_pile); i++) {
		var card = discard_pile[|i];
		card.hover = false;
		card.selected = false;
	}
}


//esc exit full screen, affecting all time
if (keyboard_check(vk_escape)) {
	window_set_fullscreen(false);
} if (keyboard_check(ord("F"))) {
	window_set_fullscreen(true);
}

if (keyboard_check(ord("R"))) {
	game_restart();
}