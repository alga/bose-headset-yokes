module ausine() {
    rotate([0, 0, 16]) translate([63, 0, 2]) rotate([0, 103, 0]) cylinder(r=6.25/2, h=10, $fn=20);

    translate([0, -42, 0]) rotate([-90, 0, 0]) cylinder(r=2.06, h=84, $fn=20);

    %translate([0, 0, -15]) rotate([0, 0, 4]) scale([1, 0.75, 1]) cylinder(r=50, h=20);
}

module block_holes() {
    translate([15/2, 38/2, 25]) {        
        // Plate slot
        translate([-2, -4.5, -5.8-1.5/2]) cube([10, 9, 1.5]);
            
        // Screw holes
        translate([-4, 16.4/2, -3.3]) rotate([0, 90, 0]) cylinder(r=1, h=10);
        translate([-4, -16.4/2, -3.3]) rotate([0, 90, 0]) cylinder(r=1, h=10);

        // Indent for the plate
        translate([1.9, -31/2, -6.4]) cube([10, 31, 6.4]);
        
        //Square indent
        translate([-2-5, -5, -1.9])cube([10, 10, 2]);
    }
}

module block() {
    difference() {
        intersection() {
            translate([-3, 1, 0]) cube([20, 36, 25]);
            translate([36, 19, 0]) rotate([0, -13, 0]) cylinder(r=30, h=50, $fn=200);
        }
        block_holes();
    }
}

module block_position() {
    rotate([0, 0, 16]) translate([56, 0, 2]) rotate([0, 103, 0]) translate([-5.5, -19, 9.5-25])
    children();
}

module yoke() {
    intersection() {
        // Envelope with rounded end at the screws
        hull() {
            translate([0, -75, 0]) rotate([-90, 0, 0])cylinder(r=5.5, h=150);
            translate([100, -75, -5]) cube([10, 150, 11]);
        }
    difference() {
        union () {
        rotate([0, 0, 0]) translate([0, 0, -4])
           
            // Cone 
            //rotate([0, 0, 0]) scale([1.10, 0.76, 1]) cylinder(r1=58, r2=53, h=10, $fn=200);
            
            // Donut
            scale([1.11, 0.76, 1]) rotate_extrude($fn=100) translate([48, 0])circle(r=10);
            
            // Screw bosses
            translate([0, 38, 0]) rotate([-90, 0, 0]) cylinder(r=5.5, h=6, $fn=20);
            translate([0, -38, 0]) rotate([90, 0, 0]) cylinder(r=5.5, h=6, $fn=20);
            
            // Mounting block
            block_position() block();
        }
        
        // Inner ellipsoid
        rotate([0, 0, 0]) translate([0, 0, -25]) 
            scale([1.07, 0.76, 1]) cylinder(r=50, h=50, $fn=60);
        translate([0, -42, 0]) rotate([-90, 0, 0]) cylinder(r=2.2, h=84, $fn=20);

        // Screw holes
        translate([0, 41, 0]) rotate([-90, 0, 0]) cylinder(r=3.5, h=10, $fn=20);
        translate([0, -41, 0]) rotate([90, 0, 0]) cylinder(r=3.5, h=10, $fn=20);

        // Axle
        rotate([0, 0, 16]) translate([56, 0, 1.9]) rotate([0, 103, 0]) cylinder(r=6.25/2, h=10, $fn=20);
        // Bottom
        translate([-75, -75, -150-4]) cube([150, 150, 150]);
        // Top
        //translate([-75, -75, 6]) cube([150, 150, 150]);

        // Block holes (again)
        block_position() block_holes();    
      // Wire channel
      intersection () {
          difference() {
            rotate([0, 0, 4]) translate([0, 0, -4.1]) 
                scale([1.07, 0.76, 1]) cylinder(r=57, h=4, $fn=60);
            rotate([0, 0, 4]) translate([0, 0, -25]) 
                scale([1.07, 0.76, 1]) cylinder(r=53, h=50, $fn=60);
          }
          translate([5, -96, -6]) cube([100, 100, 10]);
      }
      translate([56.5, 0, -4.1]) rotate([0,0, 16])cube([8, 4, 4]);
    }}
}

module yoke_l() {
    difference() {
        yoke();
        translate([59, 17, 5])cylinder(r=3, h=2, $fn=20);
    }
    translate([59, 17, 5]) rotate([0, 0, 16-90]) 
        linear_extrude(height=0.5) text("L", size=4.5, font="DejaVu Sans:style=Bold", halign="center", valign="center");
}
module yoke_r() {
    difference() {
        mirror([0, 1, 0]) yoke();
        translate([59, -17, 5])cylinder(r=3, h=1, $fn=20);
    }
    translate([59, -17, 5]) rotate([0, 0, -16-90]) 
        linear_extrude(height=0.5) text("R", size=4.5, font="DejaVu Sans:style=Bold", halign="center", valign="center");
}
%ausine();
yoke_r();
//block();