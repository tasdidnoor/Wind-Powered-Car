// Wind Powered Car Chassis
// 8.5cm Length, 8cm Wide, Flat Top, 0.5cm Axle Holes

total_length = 85;    // 8.5 cm
sleeve_width = 80;    // 8 cm
waist_width = 30;     // 3 cm
base_h = 8.5;         // 0.85 cm
axle_diameter = 5.0;  // 0.5 cm

// Popsicle Stick: 1cm x 0.2cm
popsicle_w = 10.5;
popsicle_t = 2.5;
pocket_d = 6.5;

$fn = 100;

module cyberblade_x_85mm() {
    difference() {
        union() {
            // --- X-FRAME CHASSIS ---
            hull() {
                for(i=[-1, 1])
                    translate([i * 35, total_length/2 - 4.25, 4.25])
                        sphere(d=base_h);
                translate([0, 0, 4.25])
                    cube([waist_width, 10, base_h], center=true);
            }
            hull() {
                for(i=[-1, 1])
                    translate([i * 35, -total_length/2 + 4.25, 4.25])
                        sphere(d=base_h);
                translate([0, 0, 4.25])
                    cube([waist_width, 10, base_h], center=true);
            }

            // --- AXLE SLEEVES ---
            translate([0, total_length/2 - 4.25, 4.25])
                rotate([0, 90, 0])
                cylinder(d=base_h, h=sleeve_width, center=true);
            
            translate([0, -total_length/2 + 4.25, 4.25])
                rotate([0, 90, 0])
                cylinder(d=base_h, h=sleeve_width, center=true);
            
            // SIDE AERO-FINS
            for(i=[-1, 1]) {
                translate([i * 18, 0, 3])
                    rotate([0, 0, i * 15])
                    hull() {
                        cube([2, total_length-30, 6], center=true);
                        translate([i * 8, 0, -2]) cube([1, total_length-40, 2], center=true);
                    }
            }
        }

        // --- SUBTRACTIONS ---
        // Front Axle Hole
        translate([0, total_length/2 - 4.25, 4.25])
            rotate([0, 90, 0])
            cylinder(d=axle_diameter, h=sleeve_width + 5, center=true);
        
        // Rear Axle Hole
        translate([0, -total_length/2 + 4.25, 4.25])
            rotate([0, 90, 0])
            cylinder(d=axle_diameter, h=sleeve_width + 5, center=true);
            
        // POPSICLE STICK POCKET
        // Adjusted position for 8.5cm length
        translate([0, 15, base_h - pocket_d/2 + 0.1])
            cube([popsicle_w, popsicle_t, pocket_d], center=true);

        // Tech Grooves
        for(i=[-1, 1]) {
            translate([i*10, 0, 1])
                cube([2, total_length-40, 2], center=true);
        }
    }
}

cyberblade_x_85mm();
