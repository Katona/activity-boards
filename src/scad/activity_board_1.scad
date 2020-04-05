// CSG.scad - Basic example of CSG usage

/*
translate([-24,0,0]) {
    union() {
        cube(15, center=true);
        sphere(10);
    }
}
*/
$fa = 10;
$fs = 0.5;

module rounded_cube(size, radius) {
    width = size[0];
    height = size[1];
    depth = size[2];

    minkowski() {
        cube([width - 2 * radius, height - 2 * radius, depth - 2 * radius], center=true);
        sphere(radius);
    }
}

module case_top(size, radius, thickness) {
    width = size[0];
    height = size[1];
    depth = size[2];
    
    difference() {
        translate([0, 0, radius / 2]) {
            rounded_cube([width, height, depth + radius], radius);
        }
        translate([0, 0, depth / 2 + radius / 2]) {
            cube([width, height, radius], center=true);
        }
        translate([0, 0, depth / 2 - 1]) {
            cube([width - thickness, height - thickness, 2], center=true);
        }
        translate([0, 0, thickness]) {
            cube([width - thickness * 2, height - thickness * 2, depth], center=true);
        }
    }
}

module slider() {
    cube([6, 3.5, 2], center =true);
    translate([-8, 0, 0]) {
        cylinder(h=2, r=1.25, center=true);
    }
    translate([8, 0, 0]) {
        cylinder(h=2, r=1.25, center=true);
    }
}


module smallLed() {
    cylinder(h=2, r=2.25, center=true);
}

module bigLed() {
    cylinder(h=2, r=4, center=true);
}

module lever() {
    cylinder(h=2, r=3.25, center=true);
}

module bigSwitch() {
    cylinder(h=2, r=10.25, center=true);
    cube([5.2, 20.6, 2], center=true);
    translate([5, 0, 0]) {
        cube([11, 2.1, 2], center=true);
    }
}

module keySection() {
    cylinder(h=2, r=6.25, center=true);
    translate([0, 20, 0]) {
        smallLed();
    }
}

module triangleLedSection() {
    translate([0, -30, 0]) {  
        slider();
        translate([0, 20, 0]) {
            smallLed();
        }
        translate([-10, 30, 0]) {
            smallLed();
        }
        translate([10, 30, 0]) {
            smallLed();
        }
        translate([-10, 50, 0]) {
            bigLed();
        }
        translate([10, 50, 0]) {
            lever();
        }
    }
}

module dualSliderSection() {
    translate([-5, 0, 0]) {
        rotate([0, 0, 90]) {
            slider();
        }
        translate([0, 25, 0]) {
            smallLed();
        }
        translate([0, -25, 0]) {
            smallLed();
        }
    }
    translate([7.5, 0, 0]) {
        rotate([0, 0, 90]) {
            slider();
        }
        translate([0, 25, 0]) {
            smallLed();
        }
        translate([0, -25, 0]) {
            smallLed();
        }
    }
}

module bigLedSection() {
    translate([0, -10, 0]) {
        bigLed();
    }
    translate([0, -30, 0]) {
        bigLed();
    }
    translate([0, 20, 0]) {
        bigSwitch();
    }
}
union() {

    difference() {

//        rounded_cube([170, 84, 27], 3);

//        translate([0, 0, 2]) {
//            cube([166, 80, 27], center=true);
//        }
        case_top([170, 84, 27], 3, 2);
        translate([0, 0, -12.5]) {
            translate([-60, 0, 0]) {
                keySection();
            }
      
            translate([-25, 0, 0]) {
                triangleLedSection();
            }
            
            translate([20, 0, 0]) {
                dualSliderSection();
            }
            
            translate([60, 0, 0]) {
                bigLedSection();
            }
        }
    }
    
    translate([76, 33.5, 0]) {
        difference() {
            cylinder(h=27, r=4, center=true);
            cylinder(h=27, r=1.2, center=true);
        }
    }
    translate([-76, 33.5, 0]) {
        difference() {
            cylinder(h=27, r=4, center=true);
            cylinder(h=27, r=1.2, center=true);
        }
    }
    translate([76, -33.5, 0]) {
        difference() {
            cylinder(h=27, r=4, center=true);
            cylinder(h=27, r=1.2, center=true);
        }
    }
    translate([-76, -33.5, 0]) {
        difference() {
            cylinder(h=27, r=4, center=true);
            cylinder(h=27, r=1.2, center=true);
        }
    }
}

/*
translate([100,0,0]) {
    intersection() {
        cube(12, center=true);
        sphere(10)
    }
}
*/

echo(version=version());
// Written by Marius Kintel <marius@kintel.net>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
