class Animation {
  int position_x;
  int position_y;
  PImage tab_animation_idle[];
  int nb_animation_idle_actual;
  int nb_animation_idle;
  PImage tab_animation_walk[];
  int nb_animation_walk_actual;
  int nb_animation_walk;
  PImage tab_animation_attack[];
  int nb_animation_attack_actual;
  int nb_animation_attack;
  PImage tab_animation_die[];
  int nb_animation_die_actual;
  int nb_animation_die;
  String animation_actual;
  int animation_speed_actual;

  Animation() {
    this.position_x = 0;
    this.position_y = 0;
    this.animation_actual = "idle";
    this.animation_speed_actual = 0;
  }
 
  ///////////////////////////////////////////////////////////////getter
  ///////////////////////////////////////////////////////////////setter
  void set_animation_idle(PImage x_tab_animation[], int x_nb_animation) {
    this.tab_animation_idle = x_tab_animation;
    this.nb_animation_idle = x_nb_animation;
  }
  void set_animation_walk(PImage x_tab_animation[], int x_nb_animation) {
    this.tab_animation_walk = x_tab_animation;
    this.nb_animation_walk = x_nb_animation;
  }
  void set_animation_attack(PImage x_tab_animation[], int x_nb_animation) {
    this.tab_animation_attack = x_tab_animation;
    this.nb_animation_attack = x_nb_animation;
  }
  void set_animation_die(PImage x_tab_animation[], int x_nb_animation) {
    this.tab_animation_die = x_tab_animation;
    this.nb_animation_die = x_nb_animation;
  }

  ///////////////////////////////////////////////////////////////function
  void resize_animation(int x_size_x, int x_size_y) {
    for (int i = 0; i < this.nb_animation_idle; i++) {
      tab_animation_idle[i].resize(x_size_x, x_size_y);
    }
    for (int i = 0; i < this.nb_animation_walk; i++) {
      tab_animation_walk[i].resize(x_size_x, x_size_y);
    }
    for (int i = 0; i < this.nb_animation_attack; i++) {
      tab_animation_attack[i].resize(x_size_x, x_size_y);
    }
    for (int i = 0; i < this.nb_animation_die; i++) {
      tab_animation_die[i].resize(x_size_x, x_size_y);
    }
  }

  void update(String x_animation, int x_position_x, int x_position_y) {
    this.animation_actual = x_animation;
    this.position_x = x_position_x;
    this.position_y = x_position_y;

    if (this.animation_actual == "idle") {
      if (this.animation_speed_actual < animation_speed) {
        this.animation_speed_actual = this.animation_speed_actual + 1;
      }
      if (this.animation_speed_actual == animation_speed) {
        this.animation_speed_actual = 0;
        this.nb_animation_idle_actual = this.nb_animation_idle_actual + 1;
      }
      if (this.nb_animation_idle_actual == this.nb_animation_idle) {
        this.nb_animation_idle_actual = 0;
      }
    }
    if (this.animation_actual == "walk") {
      if (this.animation_speed_actual < animation_speed) {
        this.animation_speed_actual = this.animation_speed_actual + 1;
      }
      if (this.animation_speed_actual == animation_speed) {
        this.animation_speed_actual = 0;
        this.nb_animation_walk_actual = this.nb_animation_walk_actual + 1;
      }
      if (this.nb_animation_walk_actual == this.nb_animation_walk) {
        this.nb_animation_walk_actual = 0;
      }
    }
    if (this.animation_actual == "attack") {
      if (this.animation_speed_actual < animation_speed) {
        this.animation_speed_actual = this.animation_speed_actual + 1;
      }
      if (this.animation_speed_actual == animation_speed) {
        this.animation_speed_actual = 0;
        this.nb_animation_attack_actual = this.nb_animation_attack_actual + 1;
      }
      if (this.nb_animation_attack_actual == this.nb_animation_attack) {
        this.nb_animation_attack_actual = 0;
      }
    }
    if (this.animation_actual == "die") {
      if (this.animation_speed_actual < animation_speed) {
        this.animation_speed_actual = this.animation_speed_actual + 1;
      }
      if (this.animation_speed_actual == animation_speed) {
        this.animation_speed_actual = 0;
        this.nb_animation_die_actual = this.nb_animation_die_actual + 1;
      }
      if (this.nb_animation_die_actual == this.nb_animation_die) {
        this.nb_animation_die_actual = 0;
      }
    }
  }
  void display(int x_number) {
    if (this.animation_actual == "idle") {
      if (x_number == 2) {
        pushMatrix();
        translate(this.position_x + tab_animation_idle[this.nb_animation_idle_actual].width, this.position_y );
        scale( -1, 1 );
        image(this.tab_animation_idle[this.nb_animation_idle_actual], 0, 0);
        popMatrix();
      } else {
        image(this.tab_animation_idle[this.nb_animation_idle_actual], this.position_x, this.position_y);
      }
    }
    if (this.animation_actual == "walk") {
      if (x_number == 2) {
        pushMatrix();
        translate(this.position_x + tab_animation_walk[this.nb_animation_walk_actual].width, this.position_y );
        scale( -1, 1 );
        image(this.tab_animation_walk[this.nb_animation_walk_actual], 0, 0);
        popMatrix();
      } else {
        image(this.tab_animation_walk[this.nb_animation_walk_actual], this.position_x, this.position_y);
      }
    }
    if (this.animation_actual == "attack") {
      if (x_number == 2) {
        pushMatrix();
        translate(this.position_x + tab_animation_attack[this.nb_animation_attack_actual].width, this.position_y );
        scale( -1, 1 );
        image(this.tab_animation_attack[this.nb_animation_attack_actual], 0, 0);
        popMatrix();
      } else {
        image(this.tab_animation_attack[this.nb_animation_attack_actual], this.position_x, this.position_y);
      }
    }
    if (this.animation_actual == "die") {
      if (x_number == 2) {
        pushMatrix();
        translate(this.position_x + tab_animation_die[this.nb_animation_die_actual].width, this.position_y );
        scale( -1, 1 );
        image(this.tab_animation_die[this.nb_animation_die_actual], 0, 0);
        popMatrix();
      } else {
        image(this.tab_animation_die[this.nb_animation_die_actual], this.position_x, this.position_y);
      }
    }
  }
}
