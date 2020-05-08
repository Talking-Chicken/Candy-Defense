// set card type num
//units
global.type_footman = 0;
global.type_shieldman = 1;
global.type_atkUp = 2;
global.type_fire_rateUp = 3;
global.type_rangeUp = 4;
global.type_spUp = 5;
global.type_sniper = 6;

global.type_total = 3;


type = 0;

remove_type = 0;

//set up status
face_up = false;
placeable = false; //card that is not played on the board
inhand = false;
selected = false;
placed = false; //card that is played on the board
hover = false; //this is use  to show the bigger image

added = false; //check whether player has already choose a card to add to the deck
removed = false;

// set up x and y and depth
target_x = 0;
target_y = 0;
target_depth = 0;

