circle_r = 5000;
offset = 5;

$vpr=[0, 0, 340];   // Viewport rotation
$vpd = 150 + 10 * circle_r * $t * $t * $t;  // Camera distance as function of time


translate([-(circle_r + offset), 0, 0])
{
    color("blue")
    circle(circle_r, $fn = 1000);
}
translate([offset, -circle_r, 0])
{
    color("green")
    square(2 * circle_r);
}
