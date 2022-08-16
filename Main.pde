class Main {
  private Player tab_player[];
  private int nb_player;
  private int nb_player_max;
  private boolean is_finished;
  private PImage[] background_1;
  private PImage[] background_2;
  private PImage background_menu;
  private int player_win;
  private PImage logo_menu;
  private PImage background_end;
  private PImage logo_end[];
  private int background_offset;
  private PImage background_how2play[];
  private int level_how2play;

  Main(Player x_tab_player[], int x_nb_player, int x_nb_player_max, PImage[] x_background_1, PImage[] x_background_2, PImage x_logo_menu, PImage x_background_menu, PImage[] x_logo_end, PImage[] x_background_how2play) {
    this.background_offset = 1;
    this.tab_player = x_tab_player;
    this.nb_player = x_nb_player;
    this.nb_player_max = x_nb_player_max;
    this.background_1 = x_background_1;
    for (int i = 0; i<background_1.length; i++) {
      this.background_1[i].resize(screen_size_x, screen_size_y);
    }
    this.background_2 = x_background_2;
    for (int i = 0; i<background_2.length; i++) {
      this.background_2[i].resize(screen_size_x, screen_size_y - this.tab_player[0].get_position_y() - this.tab_player[0].get_collider().get_size_y() + (screen_size_y / 100 * background_offset));
    }
    this.is_finished = false;
    this.logo_menu = x_logo_menu;
    this.logo_menu.resize(screen_size_x / 100 * 60, screen_size_y/3);
    this.background_menu = x_background_menu;
    this.background_menu.resize(screen_size_x, screen_size_y);
    this.logo_end = x_logo_end;
    for (int i = 0; i < logo_end.length; i++) {
      this.logo_end[i].resize(screen_size_x / 100 * 60, screen_size_y/3);
    }
    this.background_how2play = x_background_how2play;
    for (int i = 0; i<background_how2play.length; i++) {
      this.background_how2play[i].resize(screen_size_x, screen_size_y);
    }
    this.level_how2play = 0;
  }

  ///////////////////////////////////////////////////////////////getter
  Player get_player(int x_player) {
    return this.tab_player[x_player];
  }
  int return_nb_player() {
    return this.nb_player;
  }
  boolean get_is_finished() {
    return is_finished;
  }
  int get_player_win() {
    return player_win;
  }

  ///////////////////////////////////////////////////////////////setter
  ///////////////////////////////////////////////////////////////function
  void remove_all_unit() {
    for (int i = 0; i < this.tab_player[0].get_nb_unit(); i++) {
      this.tab_player[0].remove_unit(0);
    }
    for (int i = 0; i < this.tab_player[1].get_nb_unit(); i++) {
      this.tab_player[1].remove_unit(0);
    }
  }

  void update() {
    println("Main: update: ...");

    if (this.tab_player[0].get_health_point() > 0 && this.tab_player[1].get_health_point() > 0) {

      //player 1 unit collide with player 1 unit
      for (int i = 0; i < this.tab_player[0].get_nb_unit(); i++) {
        for (int j = 0; j < this.tab_player[0].get_nb_unit(); j++) {
          if (i != j) {
            if (this.tab_player[0].get_unit(i).collide(this.tab_player[0].get_unit(j).get_collider(), 1) == true) {
              this.tab_player[0].get_unit(i).set_can_move(false);
            }
          }
        }
      }

      //player 2 unit collide with player 2 unit
      for (int i = 0; i < this.tab_player[1].get_nb_unit(); i++) {
        for (int j = 0; j < this.tab_player[1].get_nb_unit(); j++) {
          if (i != j) {
            if (this.tab_player[1].get_unit(i).collide(this.tab_player[1].get_unit(j).get_collider(), 2) == true) {
              this.tab_player[1].get_unit(i).set_can_move(false);
            }
          }
        }
      }

      //player 1 unit collide with player 2 unit
      //player unit damage player unit
      for (int i = 0; i < this.tab_player[0].get_nb_unit(); i++) {
        for (int j = 0; j < this.tab_player[1].get_nb_unit(); j++) {
          if (this.tab_player[0].get_unit(i).collide(this.tab_player[1].get_unit(j).get_collider(), 1) == true) {
            this.tab_player[0].get_unit(i).set_can_move(false);
            this.tab_player[1].get_unit(j).set_can_move(false);
            this.tab_player[0].get_unit(i).set_is_attack(true);
            this.tab_player[1].get_unit(j).set_is_attack(true);
            this.tab_player[0].get_unit(i).damage(this.tab_player[1].get_unit(j));
          }
          if (distance(this.tab_player[0].get_unit(i).get_position_x(), this.tab_player[1].get_unit(j).get_position_x()) <= this.tab_player[0].get_unit(i).get_range()) {
            this.tab_player[0].get_unit(i).damage(this.tab_player[1].get_unit(0));
          }
          if (distance(this.tab_player[0].get_unit(i).get_position_x(), (this.tab_player[1].get_collider().get_position_x() + (this.tab_player[1].get_collider().get_size_x() / 2))) <= this.tab_player[0].get_unit(i).get_range()) {
            this.tab_player[0].get_unit(i).damage_player(this.tab_player[1]);
          }
          if (this.tab_player[1].get_unit(j).collide(this.tab_player[0].get_unit(i).get_collider(), 2) == true) {
            this.tab_player[0].get_unit(i).set_can_move(false);
            this.tab_player[1].get_unit(j).set_can_move(false);
            this.tab_player[0].get_unit(i).set_is_attack(true);
            this.tab_player[1].get_unit(j).set_is_attack(true);
            this.tab_player[1].get_unit(j).damage(this.tab_player[0].get_unit(i));
          }
          if (distance(this.tab_player[1].get_unit(j).get_position_x(), this.tab_player[0].get_unit(i).get_position_x()) <= this.tab_player[1].get_unit(j).get_range()) {
            this.tab_player[1].get_unit(j).damage(this.tab_player[0].get_unit(0));
          }
          if (distance(this.tab_player[1].get_unit(j).get_position_x(), (this.tab_player[0].get_collider().get_position_x() + (this.tab_player[0].get_collider().get_size_x() / 2))) <= this.tab_player[1].get_unit(j).get_range()) {
            this.tab_player[1].get_unit(j).damage_player(this.tab_player[0]);
          }
        }
      }

      //unit attack base
      //player 1 to player 2
      for (int i = 0; i < this.tab_player[0].get_nb_unit(); i++) {
        if (this.tab_player[0].get_unit(i).get_collider().collide(this.tab_player[1].get_collider(), 1) == true) {
          this.tab_player[0].get_unit(i).damage_player(this.tab_player[1]);
          this.tab_player[0].get_unit(0).set_can_move(false);
          this.tab_player[0].get_unit(i).set_is_attack(true);
        }
      }
      //player 2 to player 1
      for (int j = 0; j < this.tab_player[1].get_nb_unit(); j++) {
        if (this.tab_player[1].get_unit(j).get_collider().collide(this.tab_player[0].get_collider(), 2) == true) {
          this.tab_player[1].get_unit(j).damage_player(this.tab_player[0]);
          this.tab_player[1].get_unit(0).set_can_move(false);
          this.tab_player[1].get_unit(j).set_is_attack(true);
        }
      }

      //turret attack unit
      //player 1 to player 2
      for (int i = 0; i < this.tab_player[0].get_nb_turret(); i++) {
        for (int j = 0; j < this.tab_player[1].get_nb_unit(); j++) {
          if (distance(this.tab_player[0].get_turret(i).get_position_x(), this.tab_player[1].get_unit(j).get_position_x()) <= this.tab_player[0].get_turret(i).get_range()) {
            this.tab_player[0].get_turret(i).damage(this.tab_player[1].get_unit(0));
            this.tab_player[0].get_turret(i).set_is_attack(true);
          }
        }
      }
      //player 2 to player 1
      for (int i = 0; i < this.tab_player[1].get_nb_turret(); i++) {
        for (int j = 0; j < this.tab_player[0].get_nb_unit(); j++) {
          if (distance(this.tab_player[1].get_turret(i).get_position_x(), this.tab_player[0].get_unit(j).get_position_x()) <= this.tab_player[1].get_turret(i).get_range()) {
            this.tab_player[1].get_turret(i).damage(this.tab_player[0].get_unit(0));
            this.tab_player[1].get_turret(i).set_is_attack(true);
          }
        }
      }

      //power collide with player 2 unit
      for (int i = 0; i < this.tab_player[0].get_nb_projectile(); i++) {
        for (int j = 0; j < this.tab_player[1].get_nb_unit(); j++) {
          if (this.tab_player[0].get_projectile(i).get_used() == false && this.tab_player[0].get_projectile(i).collide_total(this.tab_player[1].get_unit(j).get_collider(), 1) == true) {
            this.tab_player[0].get_projectile(i).damage(this.tab_player[1].get_unit(j));
            this.tab_player[0].get_projectile(i).set_used(true);
          }
        }
      }

      for (int i = 0; i < this.nb_player; i++) {
        tab_player[i].update(this);
      }
    }

    //end of game
    if (this.tab_player[0].get_health_point() <= 0) {
      this.is_finished = true;
      this.player_win = 2;
    }
    if (this.tab_player[1].get_health_point() <= 0) {
      this.is_finished = true;
      this.player_win = 1;
    }

    

    println("Main: update: done");
  }
  void display() {
    println("Main: display: ...");
    if (this.tab_player[0].get_period() == 1) {
      image(this.background_1[0], 0, 0);
    }
    if (this.tab_player[0].get_period() == 2) {
      image(this.background_1[1], 0, 0);
    }
    if (this.tab_player[0].get_period() == 3) {
      image(this.background_1[2], 0, 0);
    }
    if (this.tab_player[0].get_period() == 4) {
      image(this.background_1[3], 0, 0);
    }
    if (this.tab_player[0].get_period() == 5) {
      image(this.background_1[4], 0, 0);
    }
    if (this.tab_player[0].get_period() == 6) {
      image(this.background_1[5], 0, 0);
    }

    for (int i = 0; i < this.nb_player; i++) {
      tab_player[i].display();
    }

    if (this.tab_player[0].get_period() == 1) {
      image(this.background_2[0], 0, this.tab_player[0].get_position_y() + this.tab_player[0].get_collider().get_size_y() - (screen_size_y / 100 * background_offset));
    }
    if (this.tab_player[0].get_period() == 2) {
      image(this.background_2[1], 0, this.tab_player[0].get_position_y() + this.tab_player[0].get_collider().get_size_y() - (screen_size_y / 100 * background_offset));
    }
    if (this.tab_player[0].get_period() == 3) {
      image(this.background_2[2], 0, this.tab_player[0].get_position_y() + this.tab_player[0].get_collider().get_size_y() - (screen_size_y / 100 * background_offset));
    }
    if (this.tab_player[0].get_period() == 4) {
      image(this.background_2[3], 0, this.tab_player[0].get_position_y() + this.tab_player[0].get_collider().get_size_y() - (screen_size_y / 100 * background_offset));
    }
    if (this.tab_player[0].get_period() == 5) {
      image(this.background_2[4], 0, this.tab_player[0].get_position_y() + this.tab_player[0].get_collider().get_size_y() - (screen_size_y / 100 * background_offset));
    }
    if (this.tab_player[0].get_period() == 6) {
      image(this.background_2[5], 0, this.tab_player[0].get_position_y() + this.tab_player[0].get_collider().get_size_y() - (screen_size_y / 100 * background_offset));
    }

    for (int i = 0; i < this.nb_player; i++) {
      tab_player[i].display_interface();
    }


    println("Main: display: done");
  }

  void display_menu() {
    int logo_size_x = screen_size_x/2;
    int logo_size_y = screen_size_y/100 * 40;
    int logo_position_x = screen_size_x - (screen_size_x /2) - (logo_size_x / 2);
    int logo_position_y = screen_size_y /100 * 15;
    image(this.background_menu, 0, 0);
    this.logo_menu.resize(logo_size_x, logo_size_y);
    image(this.logo_menu, logo_position_x, logo_position_y);
  }



  void display_restart() {
    int logo_end_size_x = screen_size_x/2;
    int logo_end_size_y = screen_size_y/100*40;
    int logo_end_position_x = screen_size_x - (screen_size_x /100 * 45) - (logo_end_size_x /2);
    int logo_end_position_y = screen_size_y /100 *15;
    if (this.player_win == 1) {
      this.logo_end[0].resize(logo_end_size_x, logo_end_size_y);
      image(this.logo_end[0], logo_end_position_x, logo_end_position_y);
    }
    if (this.player_win == 2) {
      this.logo_end[1].resize(logo_end_size_x, logo_end_size_y);
      image(this.logo_end[1], logo_end_position_x, logo_end_position_y);
    }
  }

  void display_how2play() {
    image(this.background_how2play[level_how2play], 0, 0);

    if (button_previous_how2play.collide(mouse_x, mouse_y) == true && this.level_how2play > 0 || button_next_how2play.collide(mouse_x, mouse_y) == true && this.level_how2play < background_how2play.length - 1) {
      //cursor(HAND);
      set_cursor_hand = true;
    } else {
      //cursor(cursor_image);
    }

    if (this.level_how2play > 0) {
      button_previous_how2play.display();
      if (button_previous_how2play.collide(mouse_x, mouse_y) == true) {
        //cursor(HAND);
        if ( mouse_click == true) {
          this.level_how2play -= 1;
        }
      } else {
        //cursor(cursor_image);
      }
    }
    if (this.level_how2play < background_how2play.length - 1) {
      button_next_how2play.display();
      if (button_next_how2play.collide(mouse_x, mouse_y) == true) {
        // cursor(HAND);
        if (mouse_click == true) {
          this.level_how2play += 1;
        }
      } else {
        //cursor(cursor_image);
      }
    }
  }
  
  void reset() {
    this.is_finished = false;
    this.player_win = 0;
  }
}
