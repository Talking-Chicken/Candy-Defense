x = room_width/2
y = room_height*(4/5);

global.card_to_add = noone;
global.card_to_remove = noone;
global.removed = false;

ran_card = ds_list_create();
remove_card = ds_list_create();

gap = 30;

for (var i = 0; i < 3; i++) {
	var card = instance_create_depth(x-64*4*(1.5-i)-gap,215,0,obj_card);
	card.type = irandom_range(3,6);
	card.face_up = true;
	card.target_x = card.x;
	card.target_y = card.y;
	ds_list_add(ran_card, card);
}

for (var i = 0; i < 3; i++) {
	var ran_pos = irandom_range(0, ds_list_size(global.player_deck)-1);
	var ran = global.player_deck[|ran_pos];
	var card = instance_create_depth(x-64*4*(1.5-i)-gap,500,0,obj_card);
	card.type = ran;
	card.face_up = true;
	card.target_x = card.x;
	card.target_y = card.y;
	ds_list_add(remove_card, card);
	card.remove_type = ran_pos;
}
