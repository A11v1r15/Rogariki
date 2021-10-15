// bat defeats candy, candy defeats atom, atom defeats bat
PImage gem_bat;
PImage gem_atom;
PImage gem_candy;
PImage gem_heal;

PImage obstacle_wall;
PImage obstacle_door;
PImage obstacle_void;

PImage char_warrior;
PImage char_ranger;
PImage char_tank;
PImage char_oni;

enum Gems {
  VOID, WALL, DOOR, ATOM, BAT, CANDY, HEAL
}

void setSprites() {
  gem_bat = loadImage("bat.png");
  gem_atom = loadImage("atom.png");
  gem_candy = loadImage("candy.png");
  gem_heal = loadImage("heal.png");

  obstacle_wall = loadImage("wall.png");
  obstacle_door = loadImage("door.png");
  obstacle_void = loadImage("void.png");

  char_warrior = loadImage("warrior.png");
  char_ranger = loadImage("ranger.png");
  char_tank = loadImage("tank.png");
}

PImage getSprite(Gems gem) {
  switch(gem) {
  case ATOM:
    return gem_atom;
  case BAT:
    return gem_bat;
  case CANDY:
    return gem_candy;
  case HEAL:
    return gem_heal;
  case WALL:
    return obstacle_wall;
  case DOOR:
    return obstacle_door;
  default:
    return obstacle_void;
  }
}
