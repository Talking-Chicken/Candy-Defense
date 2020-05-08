/// @description Insert description here
// You can write your code in this editor
if (ds_exists(deck, ds_type_list)) {
	ds_list_destroy(deck);
}

if (ds_exists(hand, ds_type_list)) {
	ds_list_destroy(hand);
}

if (ds_exists(discard_pile, ds_type_list)) {
	ds_list_destroy(discard_pile);
}
if (ds_exists(global.player_deck, ds_type_list)) {
	ds_list_destroy(global.player_deck);
}