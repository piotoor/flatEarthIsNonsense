earth_r = 6371000;  // Earth's mean radius in meters
diff = 1;
angle = 0;
a = 120;
b = 120;
h = 250;
space = 300;

translate([0, 0, -earth_r]) 
{
    color("green")
    sphere(earth_r, $fn=1000);
    translate([0, -50, earth_r])
    {
        translate([2 * space, 0, 0])
        color("white")
        rotate([0, angle + 4*diff, 0])
        cube([a, b, h]);
        
        translate([space, 0, 0])
        color("orange")
        rotate([0, angle + 3*diff, 0])
        cube([a, b, h]);  
        
        color("blue")
        rotate([0, angle + 2*diff, 0])
        cube([a, b, h]);
        
        translate([-space, 0, 0])
        color("red")
        rotate([0, angle + diff, 0])
        cube([a, b, h]);
        
        translate([- 2 *space, 0, 0])
        color("yellow")
        rotate([0, angle, 0])
        cube([a, b, h]);
      
  
    }
}
