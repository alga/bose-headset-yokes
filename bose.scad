module ausine() {
    rotate([0, 0, 16]) translate([63, 0, 2]) rotate([0, 103, 0]) cylinder(r=6.25/2, h=10, $fn=20);

    translate([0, -42, 0]) rotate([-90, 0, 0]) cylinder(r=2.06, h=84, $fn=20);

    %translate([0, 0, -15]) rotate([0, 0, 4]) scale([1, 0.75, 1]) cylinder(r=50, h=20);
}



module laikiklis() {
    difference() {
        union () {
        rotate([0, 0, 4]) translate([0, 0, -4]) 
            rotate([0, 0, 0]) scale([1.1, 0.75, 1]) cylinder(r=55, h=10, $fn=60);
            translate([0, 38, 0]) rotate([-90, 0, 0]) cylinder(r=4, h=8, $fn=20);
            translate([0, -38, 0]) rotate([90, 0, 0]) cylinder(r=4, h=8, $fn=20);
            
            // Mounting block
            rotate([0, 0, 16]) translate([63, 0, 2]) rotate([0, 103, 0]) translate([-5.5, -19, 9.5-25]) cube([15, 38, 25]);
        }
        
        // Inner ellipsoid
        rotate([0, 0, 4]) translate([0, 0, -25]) 
            scale([1.1, 0.75, 1]) cylinder(r=50, h=50, $fn=60);
        translate([0, -42, 0]) rotate([-90, 0, 0]) cylinder(r=2.06, h=84, $fn=20);
        translate([-155, -75, -75]) cube([150, 150, 150]);

        // Screw holes
        translate([0, 41.9, 0]) rotate([-90, 0, 0]) cylinder(r=3, h=10, $fn=20);
        translate([0, -41.9, 0]) rotate([90, 0, 0]) cylinder(r=3, h=10, $fn=20);

        // Axle
        rotate([0, 0, 16]) translate([63, 0, 2]) rotate([0, 103, 0]) cylinder(r=6.25/2, h=10, $fn=20);
        // Bottom
        translate([-75, -75, -150-4]) cube([150, 150, 150]);
        // Top
        translate([-75, -75, 6]) cube([150, 150, 150]);
    }
}

%ausine();
laikiklis();