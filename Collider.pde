class Collider {
  private int position_x;
  private int position_y;
  private int position_x_collision = 0;
  private int position_y_collision = 0;
  private int size_x;
  private int size_y;
  private int position_x_center;
  
  Collider(int x_size_x, int x_size_y) {
    this.size_x = x_size_x;
    this.size_y = x_size_y;
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
  void set_position_x(int x_position_x) {
    this.position_x = x_position_x;
  }
  void set_position_y(int x_position_y) {
    this.position_y = x_position_y;
  }

  ///////////////////////////////////////////////////////////////function
  boolean collide(Collider x_collider, int x_number) {
    boolean result = false;
    if (x_number == 1) {
      this.position_x_collision = this.position_x + this.size_x + 10;
      if (this.position_x_collision >= x_collider.get_position_x() && this.position_x_collision <= x_collider.get_position_x() + x_collider.get_size_x()) {
        result = true;
      }
    }
    if (x_number == 2) {
      this.position_x_collision = this.position_x - 10;
      if (this.position_x_collision >= x_collider.get_position_x() && this.position_x_collision <= x_collider.get_position_x() + x_collider.get_size_x()) {
        result = true;
      }
    }
    return result;
  }

  boolean collide_total(Collider x_collider, int x_number) {
    boolean result = false;
    if (x_number == 1) {
      if (this.position_x + (this.size_x / 2) >= x_collider.get_position_x() && this.position_x + (this.size_x / 2) <= x_collider.get_position_x() + x_collider.get_size_x() && this.position_y + (this.size_y / 2) >= x_collider.get_position_y() && this.position_y + (this.size_y / 2) <= x_collider.get_position_y() + x_collider.get_size_y()) {
        result = true;
      }
    }
    return result;
  }
}
