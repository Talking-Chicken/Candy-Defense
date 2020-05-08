// position
deck_pos_x = 48;
deck_pos_y = room_height - sprite_get_height(spr_card) - 24;
player_hand_x = room_width/2;
player_hand_y = room_height - sprite_get_height(spr_card) - 24;
gap = 20;
discard_pile_x = room_width - sprite_get_width(spr_card) - 48;
discard_pile_y = room_height - sprite_get_height(spr_card) - 24;
hover_pos_y = player_hand_y - 10;
not_hover_pos_y = player_hand_y;

//when game start, full screen
window_set_fullscreen(true);

// card number
global.card_total_num = 17;
global.deck_num = 17;
global.discard_num = 0;
global.total_hand_size = 4;
global.current_hand_size = 0;
global.total_energy = 3;
global.current_energy = 3;


// create ds lists
deck = ds_list_create();
hand = ds_list_create();
discard_pile = ds_list_create();

// game stage
global.stage_deal = 0;
global.stage_player_choose = 1;
global.stage_player_units_moving = 2;
global.stage_enemy = 3;
global.stage_enemy_units_moving = 4;
global.stage_shuffle = 5;

global.stage_current = 0;

//timer
timer = 20;
reset_timer = 20;

//level
level = 1;
if (room != room0) {
	level = global.level;
}


//player selected card
global.player_selected_card = noone;


// create cards at the first time
if (ds_list_empty(global.player_deck)) {
	for (var i = 0; i < global.card_total_num; i++) {
		var card = instance_create_layer(deck_pos_x, deck_pos_y, "card", obj_card);
		card.target_x = x;
		card.target_y = y;
		if (i < 7) {
			card.type = global.type_footman;
		} if (i >= 7 && i < 14) {
			card.type = global.type_shieldman;
		} if (i >= 14 && i < 17) {
			card.type = global.type_atkUp;
		}
		ds_list_add(deck, card);
		ds_list_add(global.player_deck, card.type);
	}
} else {
	for (var i = 0; i < ds_list_size(global.player_deck); i++) {
		var card = instance_create_layer(deck_pos_x, deck_pos_y, "card", obj_card);
		card.target_x = x;
		card.target_y = y;
		card.type = global.player_deck[|i];
		ds_list_add(deck, card);
	}
}


ds_list_shuffle(deck);

// rearrange the postion
for (var i = 0; i < ds_list_size(deck); i++) {
	deck[| i].target_x = deck_pos_x;
	deck[| i].target_y = deck_pos_y;
	deck[| i].target_depth = -i;
}
