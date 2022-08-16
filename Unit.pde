class Unit {
  private int position_x;
  private int position_y;
  private int position_x_center;
  private Collider collider;
  private int health_point;
  private int health_point_max;
  private int damage;
  private int speed;
  private int range;
  private boolean can_move;
  private boolean is_attack;
  private int cost;
  private String name;
  private Animation animation;
  private String sound_attack_name;
  private AudioPlayer sound_attack;
  private String animation_name;

  Unit(Collider x_collider, int x_health_point, int x_damage, int x_speed, int x_range, int x_cost, String x_name, String x_sound_attack_name, String x_animation_name) {
    this.collider = x_collider;
    this.health_point = x_health_point;
    this.damage = x_damage;
    this.speed = x_speed;
    this.range = x_range;
    this.can_move = true;
    this.position_y = 200;
    this.cost = x_cost;
    this.name = x_name;
    this.is_attack = false;
    this.sound_attack_name = x_sound_attack_name;
    this.sound_attack = minim.loadFile("Sound_effect/" + this.sound_attack_name + ".mp3");
    this.sound_attack.setGain(-10);
    this.animation_name = x_animation_name;
    this.animation = load_animation("Unit/" + this.animation_name + "/");
    this.health_point_max = x_health_point;
  }

  ///////////////////////////////////////////////////////////////getter
  int get_position_x() {
    return this.position_x;
  }
  int get_position_y() {
    return this.position_y;
  }
  int get_health_point() {
    return this.health_point;
  }
  int get_damage() {
    return this.damage;
  }
  int get_speed() {
    return this.speed;
  }
  Collider get_collider() {
    return this.collider;
  }
  int get_range() {
    return this.range;
  }
  boolean get_can_move() {
    return this.can_move;
  }
  int get_cost() {
    return this.cost;
  }
  String get_name() {
    return this.name;
  }
  Animation get_animation() {
    return this.animation;
  }
  String get_sound_attack() {
    return this.sound_attack_name;
  }
  String get_animation_name() {
    return this.animation_name;
  }

  ///////////////////////////////////////////////////////////////setter
  void set_position_x(int x_position_x) {
    this.position_x = x_position_x;
  }
  void set_position_y(int x_position_y) {
    this.position_y = x_position_y;
  }
  void set_can_move(boolean x_result) {
    this.can_move = x_result;
  }
  void set_is_attack(boolean x_result) {
    this.is_attack = x_result;
  }
  void set_animation(Animation x_animation) {
    this.animation = x_animation;
  }

  ///////////////////////////////////////////////////////////////function
  void damage(Unit x_unit) {
    x_unit.take_damage(this.damage);
  }
  void damage_player(Player x_player) {
    x_player.take_damage(this.damage);
  }
  void take_damage(int x_damage) {
    this.health_point = this.health_point - x_damage;
  }

  void move(int x_number) {
    println("Player_" + x_number + ": Unit: move: ...");
    if (can_move == true) {
      if (x_number == 1) {
        this.position_x = this.position_x + this.speed;
      }
      if (x_number == 2) {
        this.position_x = this.position_x - this.speed;
      }
    }
    println("Player_" + x_number + ": Unit: move: done");
  }
  boolean is_dead() {
    if (this.health_point <= 0) {
      return true;
    }
    return false;
  }
  boolean collide(Collider x_collider, int x_number) {
    boolean result = false;

    if (this.collider.collide(x_collider, x_number) == true) {
      result = true;
    }

    return result;
  }

  void update(int x_number) {
    println("Player_" + x_number + ": Unit: update: ...");
    this.collider.set_position_x(this.position_x);
    this.collider.set_position_y(this.position_y);
    this.move(x_number);
    println("Player_" + x_number + ": Unit: update: done");

    if (this.can_move == false && is_attack == false) {
      this.animation.update("idle", this.position_x, this.position_y);
    } else if (this.can_move == false && is_attack == true) {
      this.animation.update("attack", this.position_x, this.position_y);
      if (sound_attack.position()>=sound_attack.length()) {
        sound_attack.rewind();
      }
      this.sound_attack.play();
    } else if (can_move == true) {
      this.animation.update("walk", this.position_x, this.position_y);
    }

    this.can_move = true;
  }
  void display(int x_number) {
    println("Unit: display: ...");
    fill(255);
    //rect(this.collider.get_position_x(), this.collider.get_position_y(), this.collider.get_size_x(), this.collider.get_size_y());
    /*
    fill(0);
     textSize(10);
     text(this.health_point, this.position_x, this.position_y+10);
     */
    this.animation.display(x_number);
    println("Unit: display: done");

    int health_bar_size_y = 8;
    int health_bar_position_y = 10;
    int health_bar_actual = 0;
    int health_bar_position_x = 0;

    fill(255, 0, 0);
    if (x_number == 1) {
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
}
