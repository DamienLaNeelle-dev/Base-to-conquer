int unit_delay;
int unit_delay_actual;

int turret_delay;
int turret_delay_actual;
 
int unit_to_create;
int turret_to_create;
int turret_to_remove;

boolean ai_initialisation = false;
boolean create_unit = false;
boolean create_turret = false;

void ai(Main x_main) {
  if (ai_initialisation == false) {
    ai_initialisation();
    ai_initialisation = true;
  }

  unit_delay_actual = unit_delay_actual + 1;
  turret_delay_actual = turret_delay_actual + 1;

  //add unit
  if (create_unit == false) {
    create_unit = true;
    unit_delay_actual = 0;
    unit_delay = int(random(130, 180));
  }
  if (create_turret == false) {
    create_turret = true;
    turret_delay_actual = 0;
    turret_delay = int(random(1500, 2000));
  }

  //add turret
  if (unit_delay_actual >= unit_delay) {
    unit_delay_actual = 0;
    create_unit = false;
    unit_to_create = int(random(1, 4));
    create_unit(x_main, unit_to_create);
  }
  if (turret_delay_actual >= turret_delay) {
    turret_delay_actual = 0;
    create_turret = false;
    turret_to_create = int(random(1, 4));
    create_turret(x_main, turret_to_create);
  }

  //remove turret
  if (x_main.get_player(1).get_nb_turret() == x_main.get_player(1).get_nb_turret_limit()) {
    turret_to_remove = int(random(1, x_main.get_player(1).get_nb_turret_limit()));
    x_main.get_player(1).remove_turret(turret_to_remove);
  }

  //add period
  if (x_main.get_player(0).get_exp() >= x_main.get_player(0).get_period_cost()) {
    if (x_main.get_player(0).get_period() == x_main.get_player(1).get_period()) {
      x_main.get_player(1).add_period();
    }
  }
}

void create_unit(Main x_main, int x_unit) {
  if (x_main.get_player(1).get_period() == 1) {
    if (x_unit == 1) {
      x_main.get_player(1).add_unit(unit_1);
    }
    if (x_unit == 2) {
      x_main.get_player(1).add_unit(unit_2);
    }
    if (x_unit == 3) {
      x_main.get_player(1).add_unit(unit_3);
    }
  }
  if (x_main.get_player(1).get_period() == 2) {
    if (x_unit == 1) {
      x_main.get_player(1).add_unit(unit_11);
    }
    if (x_unit == 2) {
      x_main.get_player(1).add_unit(unit_12);
    }
    if (x_unit == 3) {
      x_main.get_player(1).add_unit(unit_13);
    }
  }
  if (x_main.get_player(1).get_period() == 3) {
    if (x_unit == 1) {
      x_main.get_player(1).add_unit(unit_21);
    }
    if (x_unit == 2) {
      x_main.get_player(1).add_unit(unit_22);
    }
    if (x_unit == 3) {
      x_main.get_player(1).add_unit(unit_23);
    }
  }
  if (x_main.get_player(1).get_period() == 4) {
    if (x_unit == 1) {
      x_main.get_player(1).add_unit(unit_31);
    }
    if (x_unit == 2) {
      x_main.get_player(1).add_unit(unit_32);
    }
    if (x_unit == 3) {
      x_main.get_player(1).add_unit(unit_33);
    }
  }
  if (x_main.get_player(1).get_period() == 5) {
    if (x_unit == 1) {
      x_main.get_player(1).add_unit(unit_41);
    }
    if (x_unit == 2) {
      x_main.get_player(1).add_unit(unit_42);
    }
    if (x_unit == 3) {
      x_main.get_player(1).add_unit(unit_43);
    }
  }
  if (x_main.get_player(1).get_period() == 6) {
    if (x_unit == 1) {
      x_main.get_player(1).add_unit(unit_51);
    }
    if (x_unit == 2) {
      x_main.get_player(1).add_unit(unit_52);
    }
    if (x_unit == 3) {
      x_main.get_player(1).add_unit(unit_53);
    }
  }
}

void create_turret(Main x_main, int x_turret) {
  if (x_main.get_player(1).get_period() == 1) {
    if (x_turret == 1) {
      x_main.get_player(1).add_turret(turret_1);
    }
    if (x_turret == 2) {
      x_main.get_player(1).add_turret(turret_2);
    }
    if (x_turret == 3) {
      x_main.get_player(1).add_turret(turret_3);
    }
  }
  if (x_main.get_player(1).get_period() == 2) {
    if (x_turret == 1) {
      x_main.get_player(1).add_turret(turret_11);
    }
    if (x_turret == 2) {
      x_main.get_player(1).add_turret(turret_12);
    }
    if (x_turret == 3) {
      x_main.get_player(1).add_turret(turret_13);
    }
  }
  if (x_main.get_player(1).get_period() == 3) {
    if (x_turret == 1) {
      x_main.get_player(1).add_turret(turret_21);
    }
    if (x_turret == 2) {
      x_main.get_player(1).add_turret(turret_22);
    }
    if (x_turret == 3) {
      x_main.get_player(1).add_turret(turret_23);
    }
  }
  if (x_main.get_player(1).get_period() == 4) {
    if (x_turret == 1) {
      x_main.get_player(1).add_turret(turret_31);
    }
    if (x_turret == 2) {
      x_main.get_player(1).add_turret(turret_32);
    }
    if (x_turret == 3) {
      x_main.get_player(1).add_turret(turret_33);
    }
  }
  if (x_main.get_player(1).get_period() == 5) {
    if (x_turret == 1) {
      x_main.get_player(1).add_turret(turret_41);
    }
    if (x_turret == 2) {
      x_main.get_player(1).add_turret(turret_42);
    }
    if (x_turret == 3) {
      x_main.get_player(1).add_turret(turret_43);
    }
  }
  if (x_main.get_player(1).get_period() == 6) {
    if (x_turret == 1) {
      x_main.get_player(1).add_turret(turret_51);
    }
    if (x_turret == 2) {
      x_main.get_player(1).add_turret(turret_52);
    }
    if (x_turret == 3) {
      x_main.get_player(1).add_turret(turret_53);
    }
  }
}

void ai_initialisation() {
  unit_delay = 0;
  unit_delay_actual = 0;

  unit_to_create = 0;
  turret_to_create = 0;
  turret_to_remove = 0;
}
