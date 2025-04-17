include <config.scad>;
casino_chip_radius = 40/2;
casino_chip_height = 3.3;
min_thickness = 5;

module casino_chip_tray(angle,length, columns=1) {
    width = casino_chip_radius*2*columns + min_thickness*2;
    //height = cos(angle)*(casino_chip_radius + min_thickness) +
    module base() {
        rotate([90, 0, 90])linear_extrude(width, center=true) polygon([
            [0, 0],
            [0, cos(angle) * (casino_chip_radius + min_thickness)],
            [cos(angle)*(length+min_thickness), cos(angle) * (casino_chip_radius + min_thickness) +sin(angle) * (length + min_thickness)],
            [sin(angle)*(casino_chip_radius + min_thickness) + cos(angle) * (length + min_thickness), sin(angle)*(length + min_thickness)],
            [sin(angle)*(casino_chip_radius + min_thickness) + cos(angle) * (length+ min_thickness), 0]
        
        ]);
    }
    module groove() {
         translate([0, 0, cos(angle) * (casino_chip_radius + min_thickness)]) rotate([90-angle, 0, 180]) translate([0, 0, min_thickness]) cylinder(h=(length+eps), r=casino_chip_radius + eps, center=false);
    } 
    difference(){
        base();
        translate([-width/2 + min_thickness + casino_chip_radius, 0, 0]){
            for( i= [1:columns]){
                translate([(i-1)*casino_chip_radius*2, 0, 0]) groove();
            }
        }    
    }
}
translate([0, -100, 0]) casino_chip_tray(angle=60, length = casino_chip_height*25, columns=3);
translate([-60, 0, 0]) casino_chip_tray(angle = 0, length = casino_chip_height * 25 );
translate([0, 0, 0]) casino_chip_tray(angle = 45, length = casino_chip_height * 25);
translate([60, 0, 0]) casino_chip_tray(angle = 90, length = casino_chip_height * 25);
