earth_r = 6371000;  // Earth's mean radius in meters
$vpr = [80, 0, 320];   // Viewport rotation
$vpd = 500 + 100000000 * $t * $t * $t;  // Camera distance as function of time

translate([0, 0, -earth_r]) 
{
    color("green")
    sphere(earth_r, $fn=1000);
    translate([0, 0, earth_r])
    {
        color("blue")
        cube(100);
        translate([-300, 0, 0])
        {
            color("red")
            cube(150);
        }
        translate([350, 200, 0])
        color("yellow")
        cube(50);
        translate([-150, -200, 0])
        color("white")
        cube(60);
        
    }
}
