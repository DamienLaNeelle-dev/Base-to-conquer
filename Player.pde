class Player {
  private int health_point;
  private int health_point_max;
  private int number;
  private Unit tab_unit[];
  private int nb_unit;
  private int nb_unit_max;
  private Collider collider;
  private int position_x;
  private int position_y;
  private int money;
  private int exp;
  private int period;
  private Turret tab_turret[];
  private int nb_turret;
  private int nb_turret_max;
  private int nb_turret_limit;
  private Projectile tab_projectile[];
  private int nb_projectile;
  private String power_name;
  private String period_name;
  private boolean can_use_power;
  private int power_charge_actual;
  private int power_charge;
  private int add_turret_max_cost;
  private int add_period_cost;
  private int period_max;
  private PImage tab_base_player[];

  private PImage tab_image_power[];

  private PImage tab_button_image_power[];
  private int tab_button_image_power_position_x;
  private int tab_button_image_power_position_y;

  Player(int x_number, int x_health_point, Collider x_collider, int x_position_x, int x_position_y, int x_money, PImage x_tab_base_player[], PImage x_tab_image_power[], PImage x_tab_button_image_power[], int x_tab_button_image_power_position_x, int x_tab_button_image_power_position_y) {
    this.health_point = x_health_point;
    this.collider = x_collider;
    this.position_x = x_position_x;
    this.position_y = x_position_y;
    this.number = x_number;
    this.nb_unit = 0;
    this.nb_unit_max = 50;
    this.tab_unit = new Unit[this.nb_unit_max];
    this.collider.position_x = this.position_x;
    this.collider.position_y = this.position_y;
    this.money = x_money;
    this.exp = 0;
    this.period = 1;
    this.nb_turret = 0;
    this.nb_turret_max = 1;
    this.nb_turret_limit = 4;
    this.tab_turret = new Turret[this.nb_turret_limit];
    can_use_power = false;
    power_charge_actual = 0;
    //power_charge = 100;
    power_charge = 800;
    add_turret_max_cost = 1000;
    add_period_cost = 2000;
    period_max = 6;
    this.tab_base_player = x_tab_base_player;
    this.health_point_max = this.health_point;

    if (this.number == 2) {
      this.nb_turret_max = this.nb_turret_limit;
    }

    for (int i = 0; i < this.period_max; i++) {
      this.tab_base_player[i].resize(this.collider.get_size_x(), this.collider.get_size_y());
    }
    this.tab_image_power = x_tab_image_power;

    this.tab_button_image_power = x_tab_button_image_power;
    this.tab_button_image_power_position_x = x_tab_button_image_power_position_x;
    this.tab_button_image_power_position_y = x_tab_button_image_power_position_y;
  }

  ///////////////////////////////////////////////////////////////getter
  int get_health_point() {
    return this.health_point;
  }
  int get_number() {
    return this.number;
  }
  Unit get_unit(int x_unit) {
    return this.tab_unit[x_unit];
  }
  int get_nb_unit() {
    return this.nb_unit;
  }
  Collider get_collider() {
    return this.collider;
  }
  int get_period() {
    return this.period;
  }
  int get_period_cost() {
    return this.add_period_cost;
  }
  Turret get_turret(int x_turret) {
    return this.tab_turret[x_turret];
  }
  int get_nb_turret() {
    return this.nb_turret;
  }
  Projectile get_projectile(int x_projectile) {
    return this.tab_projectile[x_projectile];
  }
  int get_nb_projectile() {
    return this.nb_projectile;
  }
  int get_power_charge() {
    return this.power_charge;
  }
  int get_money() {
    return this.money;
  }
  int get_exp() {
    return this.exp;
  }
  int get_nb_turret_limit() {
    return this.nb_turret_limit;
  }
  int get_position_x() {
    return this.position_x;
  }
  int get_position_y() {
    return this.position_y;
  }

  ///////////////////////////////////////////////////////////////setter
  void set_money(int x_money) {
    this.money = x_money;
  }
  void set_exp(int x_exp) {
    this.exp = x_exp;
  }

  ///////////////////////////////////////////////////////////////function
  void add_unit(Unit x_unit) {
    println("Player_" + this.number + ": add_unit: ...");
    if (this.money >= x_unit.get_cost() && this.nb_unit < this.nb_unit_max) {
      this.money = this.money - x_unit.get_cost();
      Unit unit_to_add = new Unit(new Collider(x_unit.get_collider().get_size_x(), x_unit.get_collider().get_size_y()), x_unit.get_health_point(), x_unit.get_damage(), x_unit.get_speed(), x_unit.get_range(), x_unit.get_cost(), x_unit.get_name(), x_unit.get_sound_attack(), x_unit.get_animation_name());

      if (this.number == 1) {
        unit_to_add.set_position_x(this.position_x + this.get_collider().get_size_x() - this.collider.get_size_x());
      }
      if (this.number == 2) {
        unit_to_add.set_position_x(this.position_x + this.get_collider().get_size_x() - unit_to_add.collider.get_size_x());
      }
      unit_to_add.set_position_y(this.position_y + this.collider.get_size_y() - unit_to_add.get_collider().get_size_y());
      unit_to_add.get_animation().resize_animation(unit_to_add.get_collider().get_size_x(), unit_to_add.get_collider().get_size_y());
      this.tab_unit[this.nb_unit] = unit_to_add;
      this.nb_unit = this.nb_unit + 1;
    }
    println("Player_" + this.number + ": add_unit: done");
  }
  void remove_unit(int x_number) {
    println("Player_" + this.number + ": remove_unit: ...");
    for (int i = x_number; i < this.nb_unit - 1; i++) {
      this.tab_unit[i] = this.tab_unit[i + 1];
    }
    this.nb_unit = this.nb_unit - 1;
    println("Player_" + this.number + ": remove_unit: done");
  }
  void take_damage(int x_damage) {
    this.health_point = this.health_point - x_damage;
  }
  void add_period() {
    if (this.period < this.period_max && this.exp >= this.add_period_cost) {
      this.period = this.period + 1;
      this.exp = this.exp - this.add_period_cost;
      this.add_period_cost = this.add_period_cost * 2;
      this.health_point = this.health_point * 2;
      this.health_point_max = this.health_point_max * 2;
    }
  }

  void add_turret(Turret x_turret) {
    println("Player_" + this.number + ": add_turret: ...");

    if (this.nb_turret < this.nb_turret_max) {
      int turret_to_add_size_x = 50;
      int turret_to_add_size_y = 50;
      int turret_to_add_decal = 10;

      Turret turret_to_add = new Turret(0, this.position_y + (turret_to_add_decal * (this.nb_turret_max - this.nb_turret)) + (turret_to_add_size_y * (this.nb_turret_max - this.nb_turret)), turret_to_add_size_x, turret_to_add_size_y, x_turret.get_damage(), x_turret.get_range(), x_turret.get_cost(), x_turret.get_name(), x_turret.get_sound_attack(), x_turret.get_animation_name());

      if (this.number == 1) {
        if (this.money >= x_turret.get_cost()) {
          turret_to_add.set_position_x(0);
          this.money = this.money - turret_to_add.get_cost();
        }
      }
      if (this.number == 2) {
        if (this.nb_turret < this.nb_turret_limit) {
          turret_to_add.set_position_x(screen_size_x - turret_to_add.get_size_x());
        }
      }
      turret_to_add.get_animation().resize_animation(turret_to_add.get_size_x(), turret_to_add.get_size_y());
      this.tab_turret[this.nb_turret] = turret_to_add;
      this.nb_turret = this.nb_turret + 1;
    }
    println("Player_" + this.number + ": add_turret: done");
  }

  void remove_turret(int x_nb_turret) {
    println("Player_" + this.number + ": remove_turret: ...");

    if (this.nb_turret > 0) {
      for (int i = x_nb_turret - 1; i < this.nb_turret - 1; i++) {
        this.tab_turret[i] = this.tab_turret[i + 1];
      }
      this.nb_turret = this.nb_turret - 1;
    }

    println("Player_" + this.number + ": remove_turret: done");
  }
  void add_turret_max() {
    if (this.money >= this.add_turret_max_cost) {
      this.money = this.money - add_turret_max_cost;
      this.nb_turret_max = this.nb_turret_max + 1;
      this.add_turret_max_cost = this.add_turret_max_cost * 4;
      if (this.nb_turret_max >= this.nb_turret_limit) {
        this.nb_turret_max = this.nb_turret_limit;
      }
    }
  }

  void power() {
    if (can_use_power == true) {
      if (this.period == 1) {
        this.power_period(15, 50, 70, 1000, 5, this.tab_image_power[0]);
      }
      if (this.period == 2) {
        this.power_period(25, 25, 50, 1300, 5, this.tab_image_power[1]);
      }
      if (this.period == 3) {
        this.power_period(20, 40, 40, 1600, 5, this.tab_image_power[2]);
      }
      if (this.period == 4) {
        this.power_period(30, 10, 30, 2400, 5, this.tab_image_power[3]);
      }
      if (this.period == 5) {
        this.power_period(25, 20, 40, 3000, 5, this.tab_image_power[4]);
      }
      if (this.period == 6) {
        this.power_period(40, 20, 100, 5000, 40, this.tab_image_power[5]);
      }
      this.can_use_power = false;
      this.power_charge_actual = 0;
    }
  }

  void power_period(int x_nb_projectile, int x_size_x, int x_size_y, int x_damage, int x_speed, PImage x_image) {
    this.nb_projectile = x_nb_projectile;
    this.tab_projectile = new Projectile[nb_projectile];
    for (int i = 0; i < nb_projectile; i++) {
      float random_float = random(this.position_x + this.collider.get_size_x(), screen_size_x - this.collider.get_size_x());
      int random_int = int(random_float);
      this.tab_projectile[i] = new Projectile(random_int, 0, x_size_x, x_size_y, new Collider(x_size_x, x_size_y), x_damage, x_speed, x_image);
    }
  }

  void update(Main x_main) {
    println("Player_" + this.number + ": update: ...");
    for (int i = 0; i < this.nb_unit; i++) {
      tab_unit[i].update(this.number);
      if (tab_unit[i].is_dead() == true) {
        if (this.number == 2) {
          x_main.get_player(0).set_money(x_main.get_player(0).get_money() + (this.tab_unit[i].get_cost() * 2));
          x_main.get_player(0).set_exp(x_main.get_player(0).get_exp() + this.tab_unit[i].get_cost());
        }
        this.remove_unit(i);
      }
    }
    for (int i = 0; i < this.nb_turret; i++) {
      this.tab_turret[i].update(this.number);
    }
    for (int i = 0; i < this.nb_projectile; i++) {
      this.tab_projectile[i].update();
    }
    if (this.number == 2) {
      this.money = 999999;
      this.exp = 999999;
    }

    int turret_to_add_size_x = 50;
    int turret_to_add_size_y = 50;
    int turret_to_add_decal = 5;

    for (int i = 0; i < this.nb_turret; i++) {
      this.tab_turret[i].set_position_y(this.position_y + (turret_to_add_decal * (this.nb_turret_limit - (i+1))) + (turret_to_add_size_y * (this.nb_turret_limit - (i+1))));
    }

    this.power_charge_actual = this.power_charge_actual + 1;
    if (this.power_charge_actual > this.power_charge) {
      this.power_charge_actual = this.power_charge;
      can_use_power = true;
    }

    println("Player_" + this.number + ": update: done");
  }
  void display() {
    println("Player_" + this.number + ": display: ...");
    fill(100, 100, 200);
    //rect(this.position_x, this.position_y, this.collider.get_size_x(), this.collider.get_size_y());

    image(this.tab_base_player[this.period-1], this.position_x, this.position_y);

    for (int i = 0; i < this.nb_unit; i++) {
      this.tab_unit[i].display(this.number);
    }
    for (int i = 0; i < this.nb_turret; i++) {
      this.tab_turret[i].display(this.number);
    }
    for (int i = 0; i < this.nb_projectile; i++) {
      if (this.tab_projectile[i].get_used() == false) {
        this.tab_projectile[i].display();
      }
    }
    /*
    fill(0);
     text(this.health_point, this.position_x + 50, this.position_y+10);
     text(this.money, this.position_x + 50, this.position_y+20);
     text(this.exp, this.position_x + 50, this.position_y+30);
     text(this.period, this.position_x + 50, this.position_y+40);
     text(this.nb_turret, this.position_x + 50, this.position_y+50);
     text(this.power_charge_actual, this.position_x + 50, this.position_y+60);
     */
    println("Player_" + this.number + ": display: done");

    int health_bar_size_y = 8;
    int health_bar_position_y = 10;
    int health_bar_actual = 0;
    int health_bar_position_x = 0;

    fill(255, 0, 0);
    if (this.number == 1) {
      health_bar_actual = (this.health_point * this.collider.get_size_x() / this.health_point_max);
      noStroke();
      rect(this.position_x, this.position_y - health_bar_position_y, health_bar_actual, health_bar_size_y);
    } else {
      health_bar_actual = (this.health_point * this.collider.get_size_x() / this.health_point_max);
      health_bar_position_x = (this.position_x + this.collider.get_size_x() - health_bar_actual);
      noStroke();
      rect(health_bar_position_x, this.position_y - health_bar_position_y, health_bar_actual, health_bar_size_y);
    }
  }

  void display_interface() {
    int button_interval_x = 10;
    int button_interval_y = 10;
    int power_bar_actual = 0;

    int button_power_size_x = (screen_size_x / 100 * 10) + button_interval_x;
    int button_power_size_y = screen_size_x / 100 * 5;
    int button_power_position_x = button_interval_x;
    int button_power_position_y = screen_size_y - button_interval_y - button_power_size_y;

    if (this.number == 1) {
      image(this.tab_button_image_power[this.period - 1], this.tab_button_image_power_position_x, this.tab_button_image_power_position_y);
      fill(255, 0, 0, 100);
      power_bar_actual = (this.collider.get_size_x() - (this.power_charge_actual * this.collider.get_size_x() / this.power_charge));
      noStroke();
      rect(button_power_position_x, button_power_position_y, power_bar_actual, button_power_size_y);

      stroke(116, 77, 77);
      strokeWeight(5);
      fill(255, 200, 200, 150);
      rect(this.position_x, this.position_y - 125, 300, 105);

      fill(0);
      textFont(myFont);
      textSize(20);
      text("money: " + this.money, this.position_x, this.position_y - 100);
      text("exp: " + this.exp, this.position_x, this.position_y + 25 - 100);
      text("exp needed: " + this.add_period_cost, this.position_x, this.position_y + 50 - 100);
      text("health point: " + this.health_point, this.position_x, this.position_y + 75 - 100);
    }
  }
  
  void reset(int x_health_point_base, int x_money_base) {
    this.health_point = x_health_point_base;
    this.money = x_money_base;
    this.nb_unit = 0;
    this.exp = 0;
    this.period = 1;
    this.nb_turret = 0;
    this.nb_turret_max = 1;
    this.can_use_power = false;
    this.add_turret_max_cost = 1000;
    this.add_period_cost = 500;
    this.health_point_max = this.health_point;
  }
}
