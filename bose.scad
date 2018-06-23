module ausine() {
    rotate([0, 0, 16]) translate([63, 0, 2]) rotate([0, 103, 0]) cylinder(r=6.25/2, h=10, $fn=20);

    translate([0, -42, 0]) rotate([-90, 0, 0]) cylinder(r=2.06, h=84, $fn=20);

    %translate([0, 0, -15]) rotate([0, 0, 4]) scale([1, 0.75, 1]) cylinder(r=50, h=20);
}

module block() {
    difference() {
        intersection() {
            cube([15, 38, 25]);
            translate([36, 19, 0]) rotate([0, -13, 0]) cylinder(r=30, h=50, $fn=200);
        }
        translate([15/2, 38/2, 25]) {
            
            // Plate slot
            translate([-2, -4.5, -6]) cube([10, 9, 1.5]);
            
            // Screw holes
            translate([0, 16.4/2, -3.3]) rotate([0, 90, 0]) cylinder(r=1, h=10);
            translate([0, -16.4/2, -3.3]) rotate([0, 90, 0]) cylinder(r=1, h=10);

            // Indent for the plate
            translate([1.9, -31/2, -6.4]) cube([10, 31, 6.4]);
        }
    }
}


module yoke() {
    intersection() {
        // Envelope with rounded end at the screws
        hull() {
            translate([0, -75, 0]) rotate([-90, 0, 0])cylinder(r=5, h=150);
            translate([100, -75, -5]) cube([10, 150, 10]);
        }
    difference() {
        union () {
        rotate([0, 0, 4]) translate([0, 0, -4]) 
            rotate([0, 0, 0]) scale([1.10, 0.76, 1]) cylinder(r1=58, r2=53, h=10, $fn=200);
            translate([0, 38, 0]) rotate([-90, 0, 0]) cylinder(r=5, h=6, $fn=20);
            translate([0, -38, 0]) rotate([90, 0, 0]) cylinder(r=5, h=6, $fn=20);
            
            // Mounting block
            rotate([0, 0, 16]) translate([56, 0, 2]) rotate([0, 103, 0]) translate([-5.5, -19, 9.5-25]) block();
        }
        
        // Inner ellipsoid
        rotate([0, 0, 4]) translate([0, 0, -25]) 
            scale([1.13, 0.76, 1]) cylinder(r=50, h=50, $fn=60);
        translate([0, -42, 0]) rotate([-90, 0, 0]) cylinder(r=2.2, h=84, $fn=20);

        // Screw holes
        translate([0, 41, 0]) rotate([-90, 0, 0]) cylinder(r=3.5, h=10, $fn=20);
        translate([0, -41, 0]) rotate([90, 0, 0]) cylinder(r=3.5, h=10, $fn=20);

        // Axle
        rotate([0, 0, 16]) translate([56, 0, 1.9]) rotate([0, 103, 0]) cylinder(r=6.25/2, h=10, $fn=20);
        // Bottom
        translate([-75, -75, -150-4]) cube([150, 150, 150]);
        // Top
        translate([-75, -75, 6]) cube([150, 150, 150]);

        // Block holes (again)
        rotate([0, 0, 16]) translate([56, 0, 2]) rotate([0, 103, 0]) translate([-5.5, -19, 9.5-25])translate([15/2, 38/2, 25]) {
            
            // Plate slot
            translate([-2, -4.5, -5.8-1.5/2]) cube([10, 9, 1.5]);
            
            // Screw holes
            translate([-4, 16.4/2, -3.3]) rotate([0, 90, 0]) cylinder(r=1, h=10);
            translate([-4, -16.4/2, -3.3]) rotate([0, 90, 0]) cylinder(r=1, h=10);

            // Indent for the plate
            translate([1.9, -31/2, -6.4]) cube([10, 31, 6.4]);
            
            //Square indent
            translate([-1.5-5, -5, -1.9])cube([10, 10, 2]);
        }
        
      // Wire channel
      intersection () {
          difference() {
            rotate([0, 0, 4]) translate([0, 0, -4.1]) 
                scale([1.13, 0.76, 1]) cylinder(r=55, h=3, $fn=60);
            rotate([0, 0, 4]) translate([0, 0, -25]) 
                scale([1.14, 0.76, 1]) cylinder(r=52, h=50, $fn=60);
          }
          translate([5, -95, -6]) cube([100, 100, 10]);
      }
    }}
}

module yoke_l() {
    difference() {
        yoke();
        translate([59, 14, 4.6])cylinder(r=3, h=1, $fn=20);
    }
    translate([59, 14, 4.6]) rotate([0, 0, 16-90]) 
        linear_extrude(height=0.5) text("L", size=4, font="DejaVu Sans:style=Bold", halign="center", valign="center");
}
module yoke_r() {
    difference() {
        mirror([0, 1, 0]) yoke();
        translate([59, -14, 4.6])cylinder(r=3, h=1, $fn=20);
    }
    translate([59, -14, 4.6]) rotate([0, 0, -16-90]) 
        linear_extrude(height=0.5) text("R", size=4, font="DejaVu Sans:style=Bold", halign="center", valign="center");
}
%ausine();
yoke_l();
//block();