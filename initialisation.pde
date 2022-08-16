void initialisation() {
  ///////////////////////////////////////////////////////////////screen
  screen_size_x = width;
  screen_size_y = height;
  frame_rate = 60;

  ///////////////////////////////////////////////////////////////cursor
  cursor_image = loadImage("Interface/cursor.png");

  myFont = createFont("Modenine.TTF", 20);

  ///////////////////////////////////////////////////////////////unit
  int size_50 = screen_size_x / 100 * 3;
  int size_60 = screen_size_x / 100 * 4;
  int size_70 = screen_size_x / 100 * 5;
  int size_80 = screen_size_x / 100 * 6;
  int size_90 = screen_size_x / 100 * 7;
  int size_100 = screen_size_x / 100 * 8;
  int size_110 = screen_size_x / 100 * 9;
  int size_120 = screen_size_x / 100 * 10;

  //name, collider(size_x, size_y), health_point, damage, speed, range, cost
  unit_1 = new Unit(new Collider(size_50, size_70), 1000, 3, 5, 10, 50, "Clubman", "unit_1_attack_sound", "Unit_1");
  unit_2 = new Unit(new Collider(size_50, size_70), 1500, 2, 4, 300, 150, "Slingshotman", "shot_1_sound_effect", "Unit_2");
  unit_3 = new Unit(new Collider(size_100, size_90), 1900, 6, 3, 100, 300, "Dino", "animal_1_sound_effect", "Unit_3");

  unit_11 = new Unit(new Collider(size_50, size_70), 2000, 6, 5, 10, 200, "Hoplite", "sword_1_sound_effect", "Unit_11");
  unit_12 = new Unit(new Collider(size_50, size_70), 2500, 4, 4, 300, 400, "Spearman", "sword_1_sound_effect", "Unit_12");
  unit_13 = new Unit(new Collider(size_100, size_90), 2900, 9, 3, 100, 650, "Elephant", "animal_1_sound_effect", "Unit_13");

  unit_21 = new Unit(new Collider(size_50, size_70), 3000, 9, 5, 10, 400, "Knight", "sword_1_sound_effect", "Unit_21");
  unit_22 = new Unit(new Collider(size_50, size_70), 3500, 6, 4, 300, 600, "Crossbowman", "shot_1_sound_effect", "Unit_22");
  unit_23 = new Unit(new Collider(size_100, size_90), 3900, 12, 3, 100, 850, "Horseman", "sword_1_sound_effect", "Unit_23");

  unit_31 = new Unit(new Collider(size_50, size_70), 4000, 18, 5, 10, 800, "Dueler", "sword_1_sound_effect", "Unit_31");
  unit_32 = new Unit(new Collider(size_50, size_70), 4500, 15, 4, 300, 1200, "Rifleman", "shot_2_sound_effect", "Unit_32");
  unit_33 = new Unit(new Collider(size_50, size_70), 4900, 21, 3, 100, 1650, "Gunner", "shot_2_sound_effect", "Unit_33");

  unit_41 = new Unit(new Collider(size_50, size_70), 5000, 21, 5, 10, 1600, "Melee Infantry", "unit_1_attack_sound", "Unit_41");
  unit_42 = new Unit(new Collider(size_50, size_70), 5500, 15, 4, 300, 1900, "Infantry", "shot_2_sound_effect", "Unit_42");
  unit_43 = new Unit(new Collider(size_100, size_90), 5900, 24, 3, 100, 2400, "Tank", "t_canon_2_sound_effect", "Unit_43");

  unit_51 = new Unit(new Collider(size_50, size_70), 6000, 35, 5, 10, 2200, "Laser Blade", "laser_1_sound_effect", "Unit_51");
  unit_52 = new Unit(new Collider(size_50, size_70), 8000, 28, 4, 300, 2600, "Blaster", "laser_1_sound_effect", "Unit_52");
  unit_53 = new Unit(new Collider(size_50, size_70), 20000, 40, 3, 100, 4000, "Super Soldier", "laser_2_sound_effect", "Unit_53");

  ///////////////////////////////////////////////////////////////turret
  //name, position_x, position_y, size_x, size_y, damage, range, cost
  turret_1 = new Turret(0, 0, 0, 0, 1, 200, 200, "Slingshot", "turret_1_attack_sound", "Turret_1");
  turret_2 = new Turret(0, 0, 0, 0, 2, 250, 400, "Eggs catapult", "t_shot_1_sound_effect", "Turret_2");
  turret_3 = new Turret(0, 0, 0, 0, 3, 300, 500, "Bones catapult", "t_shot_1_sound_effect", "Turret_3");

  turret_11 = new Turret(0, 0, 0, 0, 2, 200, 400, "Onager", "t_shot_1_sound_effect", "Turret_11");
  turret_12 = new Turret(0, 0, 0, 0, 3, 250, 500, "Catapult", "t_shot_1_sound_effect", "Turret_12");
  turret_13 = new Turret(0, 0, 0, 0, 4, 300, 800, "Mangonel", "t_shot_1_sound_effect", "Turret_13");

  turret_21 = new Turret(0, 0, 0, 0, 3, 200, 400, "Boiled oil", "turret_1_attack_sound", "Turret_21");
  turret_22 = new Turret(0, 0, 0, 0, 4, 250, 500, "Trebuchet", "t_shot_1_sound_effect", "Turret_22");
  turret_23 = new Turret(0, 0, 0, 0, 5, 300, 800, "Scorpio", "t_shot_1_sound_effect", "Turret_23");

  turret_31 = new Turret(0, 0, 0, 0, 4, 200, 400, "Small Cannon", "t_canon_1_sound_effect", "Turret_31");
  turret_32 = new Turret(0, 0, 0, 0, 5, 250, 500, "Medium Cannon", "t_canon_1_sound_effect", "Turret_32");
  turret_33 = new Turret(0, 0, 0, 0, 6, 300, 800, "Large Cannon", "t_canon_2_sound_effect", "Turret_33");

  turret_41 = new Turret(0, 0, 0, 0, 5, 200, 400, "Machine gun", "t_rifle_1_sound_effect", "Turret_41");
  turret_42 = new Turret(0, 0, 0, 0, 6, 250, 500, "Small Rocket", "t_canon_1_sound_effect", "Turret_42");
  turret_43 = new Turret(0, 0, 0, 0, 7, 300, 800, "Large Rocket", "t_canon_2_sound_effect", "Turret_43");

  turret_51 = new Turret(0, 0, 0, 0, 6, 200, 400, "Titanium Shooter", "t_laser_1_sound_effect", "Turret_51");
  turret_52 = new Turret(0, 0, 0, 0, 7, 250, 500, "Laser Cannon", "t_laser_1_sound_effect", "Turret_52");
  turret_53 = new Turret(0, 0, 0, 0, 8, 300, 800, "Ion Ray", "t_laser_2_sound_effect", "Turret_53");

  ///////////////////////////////////////////////////////////////player
  //number, health_point, collider(size_x, size_y), position_x, position_y, money
  int player_1_size_x = screen_size_x / 100 * 10;
  int player_1_size_y = screen_size_y / 100 * 25;
  int player_1_position_x = 0;
  int player_1_position_y = screen_size_y / 2;
  int player_1_health_point = 2000;
  int player_1_money = 1000;

  PImage tab_base_player_1[] = new PImage[6];
  tab_base_player_1[0] = loadImage("Base/base_1_1.png");
  tab_base_player_1[1] = loadImage("Base/base_2_1.png");
  tab_base_player_1[2] = loadImage("Base/base_3_1.png");
  tab_base_player_1[3] = loadImage("Base/base_4_1.png");
  tab_base_player_1[4] = loadImage("Base/base_5_1.png");
  tab_base_player_1[5] = loadImage("Base/base_6_1.png");

  PImage tab_image_power[] = new PImage[6];
  tab_image_power[0] = loadImage("Power/power_1.png");
  tab_image_power[1] = loadImage("Power/power_2.png");
  tab_image_power[2] = loadImage("Power/power_3.png");
  tab_image_power[3] = loadImage("Power/power_4.png");
  tab_image_power[4] = loadImage("Power/power_5.png");
  tab_image_power[5] = loadImage("Power/power_6.png");

  PImage power_button[] = new PImage[6];
  power_button[0] = loadImage("Power/button_power_1.png");
  power_button[1] = loadImage("Power/button_power_2.png");
  power_button[2] = loadImage("Power/button_power_3.png");
  power_button[3] = loadImage("Power/button_power_4.png");
  power_button[4] = loadImage("Power/button_power_5.png");
  power_button[5] = loadImage("Power/button_power_6.png");

  int button_interval_x = 10;
  int button_interval_y = 10;

  int button_power_size_x = (screen_size_x / 100 * 10);
  int button_power_size_y = screen_size_x / 100 * 5;
  int button_power_position_x = button_interval_x;
  int button_power_position_y = screen_size_y - button_interval_y - button_power_size_y;

  player_1 = new Player(1, player_1_health_point, new Collider(player_1_size_x, player_1_size_y), player_1_position_x, player_1_position_y, player_1_money, tab_base_player_1, tab_image_power, power_button, button_power_position_x, button_power_position_y);

  int player_2_size_x = screen_size_x / 100 * 10;
  int player_2_size_y = screen_size_y / 100 * 25;
  int player_2_position_x = screen_size_x - player_2_size_x;
  int player_2_position_y = screen_size_y / 2;
  int player_2_health_point = 2000;
  int player_2_money = 1000;

  PImage tab_base_player_2[] = new PImage[6];
  tab_base_player_2[0] = loadImage("Base/base_1_2.png");
  tab_base_player_2[1] = loadImage("Base/base_2_2.png");
  tab_base_player_2[2] = loadImage("Base/base_3_2.png");
  tab_base_player_2[3] = loadImage("Base/base_4_2.png");
  tab_base_player_2[4] = loadImage("Base/base_5_2.png");
  tab_base_player_2[5] = loadImage("Base/base_6_2.png");

  player_2 = new Player(2, player_2_health_point, new Collider(player_2_size_x, player_2_size_y), player_2_position_x, player_2_position_y, player_2_money, tab_base_player_2, tab_image_power, power_button, button_power_position_x, button_power_position_y);

  tab_player[0] = player_1;
  tab_player[1] = player_2;

  ///////////////////////////////////////////////////////////////main
  PImage main_background[] = new PImage[6];
  main_background[0] = loadImage("Background/background_1_1.png");
  main_background[1] = loadImage("Background/background_2_1.png");
  main_background[2] = loadImage("Background/background_3_1.png");
  main_background[3] = loadImage("Background/background_4_1.png");
  main_background[4] = loadImage("Background/background_5_1.png");
  main_background[5] = loadImage("Background/background_6_1.png");
  PImage main_background_2[] = new PImage[6];
  main_background_2[0] = loadImage("Background/background_1_2.png");
  main_background_2[1] = loadImage("Background/background_2_2.png");
  main_background_2[2] = loadImage("Background/background_3_2.png");
  main_background_2[3] = loadImage("Background/background_4_2.png");
  main_background_2[4] = loadImage("Background/background_5_2.png");
  main_background_2[5] = loadImage("Background/background_6_2.png");
  PImage logo_menu = loadImage("Interface/Logo.png");
  PImage background_menu = loadImage("Background/test_background_menu.png");
  PImage logo_end[] = new PImage[2];
  logo_end[0] = loadImage("Interface/logo_you_win.png");
  logo_end[1] = loadImage("Interface/logo_you_loose.png");
  PImage background_how2play[] = new PImage[6];
  background_how2play[0] = loadImage("Background/how2play_turrets.png");
  background_how2play[1] = loadImage("Background/how2play_units.png");
  background_how2play[2] = loadImage("Background/how2play_remove_turret.png");
  background_how2play[3] = loadImage("Background/how2play_add_turret.png");
  background_how2play[4] = loadImage("Background/how2play_add_period.png");
  background_how2play[5] = loadImage("Background/how2play_base_info.png");

  main = new Main(tab_player, 2, 2, main_background, main_background_2, logo_menu, background_menu, logo_end, background_how2play);

  ///////////////////////////////////////////////////////////////button
  int button_unit_size_x = screen_size_x / 100 * 5;
  int button_unit_size_y = screen_size_x / 100 * 5;
  int button_unit_1_position_x = screen_size_x - (button_unit_size_x * 3) - (button_interval_x * 3);
  int button_unit_1_position_y = button_interval_y;
  int button_unit_2_position_x = screen_size_x - (button_unit_size_x * 2) - (button_interval_x * 2);
  int button_unit_2_position_y = button_interval_y;
  int button_unit_3_position_x = screen_size_x - (button_unit_size_x * 1) - (button_interval_x * 1);
  int button_unit_3_position_y = button_interval_y;
  int button_play_size_x = screen_size_x / 100 * 5;
  int button_play_size_y = screen_size_y / 100 * 8;
  int button_restart_size_x = screen_size_x / 100 * 5;
  int button_restart_size_y = screen_size_y / 100 * 8;
  int button_how2play_size_x = screen_size_x / 100 * 3;
  int button_how2play_size_y = screen_size_y / 100 * 5;
  int button_close_size_x = screen_size_x / 100 * 10;
  int button_close_size_y = screen_size_y / 100 * 6;


  int button_turret_size_x = screen_size_x / 100 * 5;
  int button_turret_size_y = screen_size_x / 100 * 5;
  int button_turret_1_position_x = button_interval_x * 1 + button_turret_size_x * 0;
  int button_turret_1_position_y = button_interval_y;
  int button_turret_2_position_x = button_interval_x * 2 + button_turret_size_x * 1;
  int button_turret_2_position_y = button_interval_y;
  int button_turret_3_position_x = button_interval_x * 3 + button_turret_size_x * 2;
  int button_turret_3_position_y = button_interval_y;

  int button_turret_remove_mode_size_x = screen_size_x / 100 * 5;
  int button_turret_remove_mode_size_y = screen_size_x / 100 * 5;
  int button_turret_remove_mode_position_x = button_interval_x;
  int button_turret_remove_mode_position_y = button_interval_y * 2 + button_turret_remove_mode_size_x * 1;

  int button_turret_to_add_size_x = 50;
  int button_turret_to_add_size_y = 50;
  int button_turret_to_add_decal = 10;

  int button_turret_add_max_size_x = screen_size_x / 100 * 5;
  int button_turret_add_max_size_y = screen_size_x / 100 * 5;
  int button_turret_add_max_position_x = button_interval_x * 2 + button_turret_add_max_size_x * 1;
  int button_turret_add_max_position_y = button_interval_y * 2 + button_turret_add_max_size_x * 1;

  int button_add_period_size_x = screen_size_x / 100 * 5;
  int button_add_period_size_y = screen_size_x / 100 * 5;
  int button_add_period_position_x = button_interval_x * 3 + button_add_period_size_x * 2;
  int button_add_period_position_y = button_interval_y * 2 + button_add_period_size_x * 1;

  int button_display_unit_size_x = (button_interval_x * 2) + (button_unit_size_x * 3);
  int button_display_unit_size_y = (button_unit_size_y * 1) + 35;
  int button_display_unit_position_x = screen_size_x - (button_unit_size_x * 3) - (button_interval_x * 3);
  int button_display_unit_position_y = (button_interval_y * 2) + (button_unit_size_y * 1);

  int button_display_play_size_x = (button_interval_x * 2) + (button_play_size_x * 4);
  int button_display_play_size_y = button_play_size_y * 2;
  int button_display_play_position_x = screen_size_x - (screen_size_x / 2) - (button_display_play_size_x / 2);
  int button_display_play_position_y = screen_size_y /2;

  int button_display_restart_size_x = (button_interval_x * 2) + (button_restart_size_x * 4);
  int button_display_restart_size_y = button_restart_size_y * 2;
  int button_display_restart_position_x = screen_size_x - (screen_size_x / 2) - (button_display_restart_size_x / 2);
  int button_display_restart_position_y = screen_size_y /2;

  int button_display_how2play_size_x = (button_interval_x * 2) + (button_how2play_size_x * 4);
  int button_display_how2play_size_y = button_how2play_size_y * 2;
  int button_display_how2play_position_x = screen_size_x - (screen_size_x / 2) - (button_display_how2play_size_x / 2);
  int button_display_how2play_position_y = screen_size_y / 100 * 70;

  int button_display_close_size_x = button_close_size_x;
  int button_display_close_size_y = button_close_size_y;
  int button_display_close_position_x = screen_size_x / 100 * 85;
  int button_display_close_position_y = screen_size_y / 100 * 90;

  PImage unit_button_1[] = new PImage[6];
  unit_button_1[0] = loadImage("Unit/Buttons/Age1/button_unit_1.png");
  unit_button_1[1] = loadImage("Unit/Buttons/Age2/button_unit_11.png");
  unit_button_1[2] = loadImage("Unit/Buttons/Age3/button_unit_21.png");
  unit_button_1[3] = loadImage("Unit/Buttons/Age4/button_unit_31.png");
  unit_button_1[4] = loadImage("Unit/Buttons/Age5/button_unit_41.png");
  unit_button_1[5] = loadImage("Unit/Buttons/Age6/button_unit_51.png");

  PImage unit_button_2[] = new PImage[6];
  unit_button_2[0] = loadImage("Unit/Buttons/Age1/button_unit_2.png");
  unit_button_2[1] = loadImage("Unit/Buttons/Age2/button_unit_12.png");
  unit_button_2[2] = loadImage("Unit/Buttons/Age3/button_unit_22.png");
  unit_button_2[3] = loadImage("Unit/Buttons/Age4/button_unit_32.png");
  unit_button_2[4] = loadImage("Unit/Buttons/Age5/button_unit_42.png");
  unit_button_2[5] = loadImage("Unit/Buttons/Age6/button_unit_52.png");

  PImage unit_button_3[] = new PImage[6];
  unit_button_3[0] = loadImage("Unit/Buttons/Age1/button_unit_3.png");
  unit_button_3[1] = loadImage("Unit/Buttons/Age2/button_unit_13.png");
  unit_button_3[2] = loadImage("Unit/Buttons/Age3/button_unit_23.png");
  unit_button_3[3] = loadImage("Unit/Buttons/Age4/button_unit_33.png");
  unit_button_3[4] = loadImage("Unit/Buttons/Age5/button_unit_43.png");
  unit_button_3[5] = loadImage("Unit/Buttons/Age6/button_unit_53.png");

  PImage turret_button_1[] = new PImage[6];
  turret_button_1[0] = loadImage("Turret/Buttons/Age1/button_turret_1.png");
  turret_button_1[1] = loadImage("Turret/Buttons/Age2/button_turret_11.png");
  turret_button_1[2] = loadImage("Turret/Buttons/Age3/button_turret_21.png");
  turret_button_1[3] = loadImage("Turret/Buttons/Age4/button_turret_31.png");
  turret_button_1[4] = loadImage("Turret/Buttons/Age5/button_turret_41.png");
  turret_button_1[5] = loadImage("Turret/Buttons/Age6/button_turret_51.png");

  PImage turret_button_2[] = new PImage[6];
  turret_button_2[0] = loadImage("Turret/Buttons/Age1/button_turret_2.png");
  turret_button_2[1] = loadImage("Turret/Buttons/Age2/button_turret_12.png");
  turret_button_2[2] = loadImage("Turret/Buttons/Age3/button_turret_22.png");
  turret_button_2[3] = loadImage("Turret/Buttons/Age4/button_turret_32.png");
  turret_button_2[4] = loadImage("Turret/Buttons/Age5/button_turret_42.png");
  turret_button_2[5] = loadImage("Turret/Buttons/Age6/button_turret_52.png");

  PImage turret_button_3[] = new PImage[6];
  turret_button_3[0] = loadImage("Turret/Buttons/Age1/button_turret_3.png");
  turret_button_3[1] = loadImage("Turret/Buttons/Age2/button_turret_13.png");
  turret_button_3[2] = loadImage("Turret/Buttons/Age3/button_turret_23.png");
  turret_button_3[3] = loadImage("Turret/Buttons/Age4/button_turret_33.png");
  turret_button_3[4] = loadImage("Turret/Buttons/Age5/button_turret_43.png");
  turret_button_3[5] = loadImage("Turret/Buttons/Age6/button_turret_53.png");

  PImage remove_turret_button[] = new PImage[1];
  remove_turret_button[0] = loadImage("Turret/Buttons/button_remove_turret.png");

  PImage remove_turret_button_1[] = new PImage[1];
  remove_turret_button_1[0] = loadImage("Interface/button_1.png");

  PImage remove_turret_button_2[] = new PImage[1];
  remove_turret_button_2[0] = loadImage("Interface/button_1.png");

  PImage remove_turret_button_3[] = new PImage[1];
  remove_turret_button_3[0] = loadImage("Interface/button_1.png");

  PImage remove_turret_button_4[] = new PImage[1];
  remove_turret_button_4[0] = loadImage("Interface/button_1.png");

  PImage turret_add_max_button[] = new PImage[1];
  turret_add_max_button[0] = loadImage("Turret/Buttons/button_add_turret.png");

  PImage add_period_button[] = new PImage[1];
  add_period_button[0] = loadImage("Interface/button_evolve.png");

  PImage display_unit_button[] = new PImage[1];
  display_unit_button[0] = loadImage("Interface/button_info.png");

  PImage play_button[] = new PImage[1];
  play_button[0] = loadImage("Interface/button_play.png");

  PImage restart_button[] = new PImage[1];
  restart_button[0] = loadImage("Interface/button_replay.png");

  PImage how2play_button[] = new PImage[1];
  how2play_button[0] = loadImage("Interface/how2play.png");

  PImage close_button[] = new PImage[1];
  close_button[0] = loadImage("Interface/back_menu.png");

  int button_previous_how2play_position_x = screen_size_x / 100 * 5;
  int button_previous_how2play_position_y = screen_size_y / 2;
  int button_previous_how2play_size_x = screen_size_x / 100 * 3;
  int button_previous_how2play_size_y = button_previous_how2play_size_x;

  int button_next_how2play_size_x = screen_size_x / 100 * 3;
  int button_next_how2play_size_y = button_next_how2play_size_x;
  int button_next_how2play_position_x = screen_size_x / 100 * 95 - button_next_how2play_size_x;
  int button_next_how2play_position_y = screen_size_y / 2;


  PImage previous_how2play[] = new PImage[1];
  previous_how2play[0] = loadImage("Interface/previous.png");
  PImage next_how2play[] = new PImage[1];
  next_how2play[0] = loadImage("Interface/next.png");

  button_unit_1 = new Button(/*"unit_1",*/ button_unit_1_position_x, button_unit_1_position_y, button_unit_size_x, button_unit_size_y, unit_button_1);
  button_unit_2 = new Button(/*"unit_2",*/ button_unit_2_position_x, button_unit_2_position_y, button_unit_size_x, button_unit_size_y, unit_button_2);
  button_unit_3 = new Button(/*"unit_3",*/ button_unit_3_position_x, button_unit_3_position_y, button_unit_size_x, button_unit_size_y, unit_button_3);

  button_turret_1 = new Button(/*"turret_1",*/ button_turret_1_position_x, button_turret_1_position_y, button_turret_size_x, button_turret_size_y, turret_button_1);
  button_turret_2 = new Button(/*"turret_2",*/ button_turret_2_position_x, button_turret_2_position_y, button_turret_size_x, button_turret_size_y, turret_button_2);
  button_turret_3 = new Button(/*"turret_3",*/ button_turret_3_position_x, button_turret_3_position_y, button_turret_size_x, button_turret_size_y, turret_button_3);

  button_remove_turret = new Button(/*"remove_turret",*/ button_turret_remove_mode_position_x, button_turret_remove_mode_position_y, button_turret_remove_mode_size_x, button_turret_remove_mode_size_y, remove_turret_button);
  button_remove_turret_1 = new Button(/*"",*/ 0, player_1_position_y + (button_turret_to_add_decal * 3) + (button_turret_to_add_size_y * 3), button_turret_to_add_size_x, button_turret_to_add_size_y, remove_turret_button_1);
  button_remove_turret_2 = new Button(/*"",*/ 0, player_1_position_y + (button_turret_to_add_decal * 2) + (button_turret_to_add_size_y * 2), button_turret_to_add_size_x, button_turret_to_add_size_y, remove_turret_button_2);
  button_remove_turret_3 = new Button(/*"",*/ 0, player_1_position_y + (button_turret_to_add_decal * 1) + (button_turret_to_add_size_y * 1), button_turret_to_add_size_x, button_turret_to_add_size_y, remove_turret_button_3);
  button_remove_turret_4 = new Button(/*"",*/ 0, player_1_position_y + (button_turret_to_add_decal * 0) + (button_turret_to_add_size_y * 0), button_turret_to_add_size_x, button_turret_to_add_size_y, remove_turret_button_4);

  button_turret_add_max = new Button(/*"add turret max",*/ button_turret_add_max_position_x, button_turret_add_max_position_y, button_turret_add_max_size_x, button_turret_add_max_size_y, turret_add_max_button);

  button_add_period = new Button(/*"add_period",*/ button_add_period_position_x, button_add_period_position_y, button_add_period_size_x, button_add_period_size_y, add_period_button);

  button_power = new Button(/*"power",*/ button_power_position_x, button_power_position_y, button_power_size_x, button_power_size_y, power_button);

  button_display_unit = new Button(/*"",*/ button_display_unit_position_x, button_display_unit_position_y, button_display_unit_size_x, button_display_unit_size_y, display_unit_button);

  button_play = new Button (/*"Play",*/ button_display_play_position_x, button_display_play_position_y, button_display_play_size_x, button_display_play_size_y, play_button);

  button_restart = new Button(/*"Restart",*/ button_display_restart_position_x, button_display_restart_position_y, button_display_restart_size_x, button_display_restart_size_y, restart_button);

  button_how2play = new Button(/*"Comment jouer?",*/ button_display_how2play_position_x, button_display_how2play_position_y, button_display_how2play_size_x, button_display_how2play_size_y, how2play_button);

  button_close = new Button(/*"Close",*/ button_display_close_position_x, button_display_close_position_y, button_display_close_size_x, button_display_close_size_y, close_button);

  button_previous_how2play = new Button(/*previous_how2play,*/button_previous_how2play_position_x, button_previous_how2play_position_y, button_previous_how2play_size_x, button_previous_how2play_size_y, previous_how2play);
  button_next_how2play = new Button(/*next_how2play,*/button_next_how2play_position_x, button_next_how2play_position_y, button_next_how2play_size_x, button_next_how2play_size_y, next_how2play);

  ///////////////////////////////////////////////////////////////music
  //main_music = minim.loadFile("Music/Game_music3.mp3");
  
  load_main_music = minim.loadFile("Music/Game_music3.mp3");
  load_menu_music = minim.loadFile("Music/Menu_music.mp3");
  load_endgame_music1 = minim.loadFile("Music/Endgame_music1.mp3");
  load_endgame_music2 = minim.loadFile("Music/Endgame_music2.mp3");
  
  main_music = load_main_music;
  menu_music = load_menu_music;
  endgame_music1 = load_endgame_music1;
  endgame_music2 = load_endgame_music2;
  //menu_music = minim.loadFile("Music/Troll_test.mp3");
}
