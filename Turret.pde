class Turret {
  private int position_x;
  private int position_y;
  private int size_x;
  private int size_y;
  private int damage;
  private int range;
  private int cost;
  private String name;
  private Animation animation;
  private boolean is_attack;
  private String sound_attack_name;
  private AudioPlayer sound_attack;
  private String animation_name;

  Turret(int x_position_x, int x_position_y, int x_size_x, int x_size_y, int x_damage, int x_range, int x_cost, String x_name, String x_sound_attack_name, String x_animation_name) {
    this.position_x = x_position_x;
    this.position_y = x_position_y;
    this.size_x = x_size_x;
    this.size_y = x_size_y;
    this.damage = x_damage;
    this.range = x_range;
    this.cost = x_cost;
    this.name = x_name;
    this.is_attack = false;
    this.sound_attack_name = x_sound_attack_name;
    this.sound_attack = minim.loadFile("Sound_effect/" + this.sound_attack_name + ".mp3");
    this.sound_attack.setGain(-10);
    this.animation_name = x_animation_name;
    this.animation = load_animation("Turret/" + this.animation_name + "/");
  }

  ///////////////////////////////////////////////////////////////getter
  int get_position_x() {
    return this.position_x;
  }
  int get_position_y() {
    return this.position_y;
  }
  int get_damage() {
    return this.damage;
  }
  int get_range() {
    return this.range;
  }
  int get_cost() {
    return this.cost;
  }
  String get_name() {
    return this.name;
  }
  int get_size_x() {
    return this.size_x;
  }
  int get_size_y() {
    return this.size_y;
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
  void set_animation(Animation x_animation) {
    this.animation = x_animation;
  }
  void set_is_attack(boolean x_result) {
    this.is_attack = x_result;
  }

  ///////////////////////////////////////////////////////////////function
  void damage(Unit x_unit) {
    x_unit.take_damage(this.damage);
  }

  void update(int x_number) {
    println("Player_" + x_number + ": turret: update: ...");

    if (this.is_attack == true) {
      this.animation.update("attack", this.position_x, this.position_y);
      if (sound_attack.position()>=sound_attack.length()) {
        sound_attack.rewind();
      }
      this.sound_attack.play();
    } else {
      this.animation.update("idle", this.position_x, this.position_y);
    }

    this.is_attack = false;

    println("Player_" + x_number + ": turret: update: done");
  }
  void display(int x_number) {
    println("Turret: display: ...");
    /*
    fill(0, 100, 0);
     //rect(this.position_x, this.position_y, this.size_x, this.size_y);
     fill(0);
     text(this.range, this.position_x, this.position_y + 10);
     */
    this.animation.display(x_number);
    println("Turret: display: done");
  }
}
