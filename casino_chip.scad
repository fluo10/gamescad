casino_chip_radius = 39/2;
casino_chip_height = 3.3;

module casino_chip(center, r = casino_chip_radius, h=casino_chip_height) {
    cylinder(h=h, r = r, center = center);
}

casino_chip();