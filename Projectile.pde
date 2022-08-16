class Projectile {
  private int position_x;
  private int position_y;
  private int size_x;
  private int size_y;
  private Collider collider;
  private int damage;
  private int speed;
  private boolean used;
 
  private PImage image;

  Projectile (int x_position_x, int x_position_y, int x_size_x, int x_size_y, Collider x_collider, int x_damage, int x_speed, PImage x_image) {
    this.position_x = x_position_x;
    this.position_y = x_position_y;
    this.size_x = x_size_x;
    this.size_y = x_size_y;
    this.collider = x_collider;
    this.damage = x_damage;
    this.speed = x_speed;
    this.used = false;

    this.image = x_image;
    this.image.resize(this.size_x, this.size_y);
  }

  ///////////////////////////////////////////////////////////////getter
  Collider get_collider() {
    return this.collider;
  }
  boolean get_used() {
    return this.used;
  }

  ///////////////////////////////////////////////////////////////setter
  void set_used(boolean x_result) {
    this.used = x_result;
  }

  ///////////////////////////////////////////////////////////////function
  boolean collide_total(Collider x_collider, int x_number) {
    boolean result = false;
    if (this.collider.collide_total(x_collider, x_number) == true) {
      result = true;
    }
    return result;
  }

  void move() {
    this.position_y = this.position_y + this.speed;
  }
  void damage(Unit x_unit) {
    if (this.used == false) {
      x_unit.take_damage(this.damage);
    }
  }

  void update() {
    if (this.position_y <= screen_size_y) {
      this.collider.set_position_x(this.position_x);
      this.collider.set_position_y(this.position_y);
      this.move();
    } else {
      this.used = true;
    }
  }
  void display() {
    fill(0, 100, 0);
    //rect(this.collider.get_position_x(), this.collider.get_position_y(), this.collider.get_size_x(), this.collider.get_size_y());
    fill(0, 200, 0);
    //rect(this.position_x, this.position_y, this.size_x, this.size_y);

    image(this.image, this.position_x, this.position_y);
  }
}
