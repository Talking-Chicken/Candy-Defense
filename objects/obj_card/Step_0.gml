/// @description Insert description here
// You can write your code in this editor
if (!place_meeting(x,y,obj_road) && !place_meeting(x,y,obj_unit) && !place_meeting(x,y,obj_bottom)) {
	placeable = true;
} else {
	placeable = false;
}
if (global.stage_current == global.stage_player_choose && inhand) {
	if (position_meeting(mouse_x, mouse_y, id)) {
		target_y = obj_card_dealer.hover_pos_y;
		global.player_selected_card = id;
		hover = true;
	} else if (global.player_selected_card == id) {
		target_y = obj_card_dealer.not_hover_pos_y;
		global.player_selected_card = noone;
		hover = false;
	}
	
	if (mouse_check_button_pressed(mb_left) && global.player_selected_card == self && global.current_energy >= obj_unit_collector.units[| type].cost) {
		selected = true;
		sprite_bbox_arrange();
	} else {
		//show text that say not enough energy
	}
	if (mouse_check_button_released(mb_left) && selected && placeable) {
			selected = false;
			inhand = false;
			ds_list_delete(obj_card_dealer.hand, ds_list_find_index(obj_card_dealer.hand, self));
			placed = true;
			sprite_bbox_reset();
		}
	
	if (selected) {
		target_x = mouse_x;
		target_y = mouse_y;
	} 
	
	if (placed) {
		audio_play_sound(snd_build,0,false);
		var unit = instance_create_layer(x,y,"unit",obj_unit_collector.units[| type]);
		unit.belong = obj_unit.player_unit;
		ds_list_add(global.player_chess, unit);
		x = obj_card_dealer.discard_pile_x;
		y = obj_card_dealer.discard_pile_y;
		target_x = x;
		target_y = y;
		ds_list_add(obj_card_dealer.discard_pile, self);
		target_depth = -ds_list_size(obj_card_dealer.discard_pile);
		selected = false;
		placed = false;
		global.current_energy -= unit.cost;
	}
}

if (room == room_select) {
	//for add card part
	for (var i = 0; i < ds_list_size(obj_next_round.ran_card); i++) {
		var card = obj_next_round.ran_card[|i];
		if (card.added) {
			for (var n = 0; n < ds_list_size(obj_next_round.ran_card); n++) {
				var added_card = obj_next_round.ran_card[|n];
				added_card.added = true;
			}
		}
	}
	
	//for remove card part
	for (var i = 0; i < ds_list_size(obj_next_round.remove_card); i++) {
		var card = obj_next_round.remove_card[|i];
		if (card.removed) {
			for (var n = 0; n < ds_list_size(obj_next_round.remove_card); n++) {
				var added_card = obj_next_round.remove_card[|n];
				added_card.removed = true;
			}
		}
	}
}
