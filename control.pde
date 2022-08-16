boolean mouse_click = false;

int mouse_x;
int mouse_y; 

boolean input_space = false;
boolean input_a = false;
boolean input_p = false;

void mouseClicked() {
  mouse_click = true;
}

void keyPressed() {
  if (key == ' ') {
    input_space = true;
  }
  if (key == 'a') {
    input_a = true;
  }
  if (key == 'p') {
    input_p = true;
  }
}

void keyReleased() {
  if (key == ' ') {
    input_space = false;
  }
  if (key == 'a') {
    input_a = false;
  }
  if (key == 'p') {
    input_p = false;
  }
}
