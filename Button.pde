class Button {
  private int position_x;
  private int position_y;
  private int size_x;
  private int size_y;
  private String name;
  private PImage button[];


  Button (/*String x_name,*/ int x_position_x, int x_position_y, int x_size_x, int x_size_y, PImage x_button[]) {
    this.position_x = x_position_x;
    this.position_y = x_position_y;
    this.size_x = x_size_x;
    this.size_y = x_size_y;
    //this.name = x_name;
    this.button = x_button;
    for (int i = 0; i<button.length; i++) {
      this.button[i].resize(this.size_x, this.size_y);
    }
  }

  ///////////////////////////////////////////////////////////////getter
  int get_position_x() {
    return this.position_x;
  }
  int get_position_y() {
    return this.position_y;
  }
  int get_size_x() {
    return this.size_x;
  }
  int get_size_y() {
    return this.size_y;
  }
  ///////////////////////////////////////////////////////////////setter
  ///////////////////////////////////////////////////////////////function
  boolean collide(int x_mouse_x, int x_mouse_y) {
    boolean result = false;

    if (x_mouse_x >= this.position_x &&
      x_mouse_x <= this.position_x + this.size_x &&
      x_mouse_y >= this.position_y &&
      x_mouse_y <= this.position_y + this.size_y)
    {
      result = true;
    }

    return result;
  }
  void add_unit(Main x_main, Unit x_unit) {
    x_main.get_player(0).add_unit(x_unit);
  }
  void add_turret(Main x_main, Turret x_turret) {
    x_main.get_player(0).add_turret(x_turret);
  }
  void remove_turret(Main x_main, int x_turret) {
    if (x_turret <= x_main.get_player(0).get_nb_turret()) {
      x_main.get_player(0).remove_turret(x_turret);
    }
  }
  void add_turret_max(Main x_main) {
    x_main.get_player(0).add_turret_max();
  }
  void add_period(Main x_main) {
    x_main.get_player(0).add_period();
  }
  void power(Main x_main) {
    x_main.get_player(0).power();
  }

  void display() {
    fill(200, 100, 100);
    //rect(this.position_x, this.position_y, this.size_x, this.size_y);
    //image(this.button, this.position_x, this.position_y);
    if (this.button.length == 1) {
      image(this.button[0], this.position_x, this.position_y);
    }
    if (main.get_player(0).get_period() == 1 && this.button.length > 1) {
      image(this.button[0], this.position_x, this.position_y);
    }
    if (main.get_player(0).get_period() == 2 && this.button.length > 1) {
      image(this.button[1], this.position_x, this.position_y);
    }
    if (main.get_player(0).get_period() == 3 && this.button.length > 1) {
      image(this.button[2], this.position_x, this.position_y);
    }
    if (main.get_player(0).get_period() == 4 && this.button.length > 1) {
      image(this.button[3], this.position_x, this.position_y);
    }
    if (main.get_player(0).get_period() == 5 && this.button.length > 1) {
      image(this.button[4], this.position_x, this.position_y);
    }
    if (main.get_player(0).get_period() == 6 && this.button.length > 1) {
      image(this.button[5], this.position_x, this.position_y);
    }
    if (status == 3) {
      image(this.button[0], this.position_x, this.position_y);
    }
    /*fill(0);
     text(this.name, this.position_x, this.position_y + 10);*/
  }

  void display_unit(Main x_main, int x_unit, Button x_button) {
    x_button.display();

    fill(0);
    textSize(12);
    int period_player = x_main.get_player(0).get_period();

    if (period_player == 1) {
      if (x_unit == 1) {
        this.display_x_unit(unit_1, x_button);
      }
      if (x_unit == 2) {
        this.display_x_unit(unit_2, x_button);
      }
      if (x_unit == 3) {
        this.display_x_unit(unit_3, x_button);
      }
    }
    if (period_player == 2) {
      if (x_unit == 1) {
        this.display_x_unit(unit_11, x_button);
      }
      if (x_unit == 2) {
        this.display_x_unit(unit_12, x_button);
      }
      if (x_unit == 3) {
        this.display_x_unit(unit_13, x_button);
      }
    }
    if (period_player == 3) {
      if (x_unit == 1) {
        this.display_x_unit(unit_21, x_button);
      }
      if (x_unit == 2) {
        this.display_x_unit(unit_22, x_button);
      }
      if (x_unit == 3) {
        this.display_x_unit(unit_23, x_button);
      }
    }
    if (period_player == 4) {
      if (x_unit == 1) {
        this.display_x_unit(unit_31, x_button);
      }
      if (x_unit == 2) {
        this.display_x_unit(unit_32, x_button);
      }
      if (x_unit == 3) {
        this.display_x_unit(unit_33, x_button);
      }
    }
    if (period_player == 5) {
      if (x_unit == 1) {
        this.display_x_unit(unit_41, x_button);
      }
      if (x_unit == 2) {
        this.display_x_unit(unit_42, x_button);
      }
      if (x_unit == 3) {
        this.display_x_unit(unit_43, x_button);
      }
    }
    if (period_player == 6) {
      if (x_unit == 1) {
        this.display_x_unit(unit_51, x_button);
      }
      if (x_unit == 2) {
        this.display_x_unit(unit_52, x_button);
      }
      if (x_unit == 3) {
        this.display_x_unit(unit_53, x_button);
      }
    }
  }

  private void display_x_unit(Unit x_unit, Button x_button) {
    textFont(myFont);
    textSize(18);
    text("name: " + x_unit.get_name(), x_button.get_position_x() + 10, x_button.get_position_y() + 25);
    text("health point: " + x_unit.get_health_point(), x_button.get_position_x() + 10, x_button.get_position_y() + 50);
    text("damage: " + x_unit.get_damage(), x_button.get_position_x() + 10, x_button.get_position_y() + 75);
    text("cost: " + x_unit.get_cost(), x_button.get_position_x() + 10, x_button.get_position_y() + 100);
    
    //rect(this.position_x, this.position_y + 30, 300, 105);
  }

  void display_turret(Main x_main, int x_turret, Button x_button) {
    x_button.display();

    fill(0);
    textSize(12);
    int period_player = x_main.get_player(0).get_period();

    if (period_player == 1) {
      if (x_turret == 1) {
        this.display_x_turret(turret_1, x_button);
      }
      if (x_turret == 2) {
        this.display_x_turret(turret_2, x_button);
      }
      if (x_turret == 3) {
        this.display_x_turret(turret_3, x_button);
      }
    }
    if (period_player == 2) {
      if (x_turret == 1) {
        this.display_x_turret(turret_11, x_button);
      }
      if (x_turret == 2) {
        this.display_x_turret(turret_12, x_button);
      }
      if (x_turret == 3) {
        this.display_x_turret(turret_13, x_button);
      }
    }
    if (period_player == 3) {
      if (x_turret == 1) {
        this.display_x_turret(turret_21, x_button);
      }
      if (x_turret == 2) {
        this.display_x_turret(turret_22, x_button);
      }
      if (x_turret == 3) {
        this.display_x_turret(turret_23, x_button);
      }
    }
    if (period_player == 4) {
      if (x_turret == 1) {
        this.display_x_turret(turret_31, x_button);
      }
      if (x_turret == 2) {
        this.display_x_turret(turret_32, x_button);
      }
      if (x_turret == 3) {
        this.display_x_turret(turret_33, x_button);
      }
    }
    if (period_player == 5) {
      if (x_turret == 1) {
        this.display_x_turret(turret_41, x_button);
      }
      if (x_turret == 2) {
        this.display_x_turret(turret_42, x_button);
      }
      if (x_turret == 3) {
        this.display_x_turret(turret_43, x_button);
      }
    }
    if (period_player == 6) {
      if (x_turret == 1) {
        this.display_x_turret(turret_51, x_button);
      }
      if (x_turret == 2) {
        this.display_x_turret(turret_52, x_button);
      }
      if (x_turret == 3) {
        this.display_x_turret(turret_53, x_button);
      }
    }
  }

  private void display_x_turret(Turret x_turret, Button x_button) {
    textFont(myFont);
    textSize(18);
    text("name: " + x_turret.get_name(), x_button.get_position_x() + 10, x_button.get_position_y() + 25);
    text("range: " + x_turret.get_range(), x_button.get_position_x() + 10, x_button.get_position_y() + 50);
    text("damage: " + x_turret.get_damage(), x_button.get_position_x() + 10, x_button.get_position_y() + 75);
    text("cost: " + x_turret.get_cost(), x_button.get_position_x() + 10, x_button.get_position_y() + 100);
  }
}
