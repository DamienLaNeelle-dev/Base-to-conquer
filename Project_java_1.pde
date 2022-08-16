import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
PFont myFont;

///////////////////////////////////////////////////////////////setup
void setup() {
  //fullScreen(P2D);
  size(1280, 720, P2D);
  frameRate(60);

  minim = new Minim(this);
}

///////////////////////////////////////////////////////////////screen parameter
int screen_size_x;
int screen_size_y;
int frame_rate;
int frame = 0;

///////////////////////////////////////////////////////////////initialisation
boolean initialisation_done = false;
boolean remove_turret_mode = false;
boolean set_cursor_hand = false;

///////////////////////////////////////////////////////////////global variable
int animation_speed = 20;
int status = 0; //0 = menu, 1 = game, 2 = endgame
///////////////////////////////////////////////////////////////music
AudioPlayer main_music;
AudioPlayer menu_music;
AudioPlayer endgame_music1;
AudioPlayer endgame_music2;

AudioPlayer load_main_music;
AudioPlayer load_menu_music;
AudioPlayer load_endgame_music1;
AudioPlayer load_endgame_music2;

///////////////////////////////////////////////////////////////unit
Unit unit_1;
Unit unit_2;
Unit unit_3;

Unit unit_11;
Unit unit_12;
Unit unit_13;

Unit unit_21;
Unit unit_22;
Unit unit_23;

Unit unit_31;
Unit unit_32;
Unit unit_33;

Unit unit_41;
Unit unit_42;
Unit unit_43;

Unit unit_51;
Unit unit_52;
Unit unit_53;

///////////////////////////////////////////////////////////////turret
Turret turret_1;
Turret turret_2;
Turret turret_3;

Turret turret_11;
Turret turret_12;
Turret turret_13;

Turret turret_21;
Turret turret_22;
Turret turret_23;

Turret turret_31;
Turret turret_32;
Turret turret_33;

Turret turret_41;
Turret turret_42;
Turret turret_43;

Turret turret_51;
Turret turret_52;
Turret turret_53;

///////////////////////////////////////////////////////////////player
Player player_1;
Player player_2;

Player tab_player[] = new Player[2];

///////////////////////////////////////////////////////////////main
Main main;

///////////////////////////////////////////////////////////////button
Button button_unit_1;
Button button_unit_2;
Button button_unit_3;

Button button_turret_1;
Button button_turret_2;
Button button_turret_3;

Button button_remove_turret;
Button button_turret_add_max;

Button button_remove_turret_1;
Button button_remove_turret_2;
Button button_remove_turret_3;
Button button_remove_turret_4;

Button button_add_period;

Button button_power;

Button button_display_unit;

Button button_play;

Button button_restart;

Button button_how2play;

Button button_close;

Button button_previous_how2play;

Button button_next_how2play;

PImage cursor_image;

///////////////////////////////////////////////////////////////draw
void draw() {


  background(255);


  if (status == 0) {
    if (initialisation_done == false) {
      initialisation();
      initialisation_done = true;
    }
    menu_loop();
  }
  if (status == 1) {
    game_loop();
  }
  if (status == 2) {
    endgame_loop();
    //initialisation_done = false;
  }
  if (status == 3) {
    how2play_loop();
    //initialisation_done = false;
  }

  //loop sound
  if (main_music.position()>=main_music.length()) {
    main_music.rewind();
  }
  if (menu_music.position()>=menu_music.length()) {
    menu_music.rewind();
  }
  
  /*
  if (endgame_music1.position()>=endgame_music1.length()) {
    endgame_music1.rewind();
  }
  if (endgame_music2.position()>=endgame_music2.length()) {
    endgame_music2.rewind();
  }
  */
  /*
  long maxMemory = Runtime.getRuntime().maxMemory();
   long allocatedMemory = Runtime.getRuntime().totalMemory();
   long freeMemory = Runtime.getRuntime().freeMemory();
   
   fill(0, 255, 0);
   stroke(0, 255, 0);
   textSize(20);
   text("max memory: " + maxMemory, 300, 100);
   text("allocated memory: " + allocatedMemory, 300, 150);
   text("free memory: " + freeMemory, 300, 200);
   */


  set_cursor();

  ///////////////////////////////////////////////////////////////reset
  reset();
}
