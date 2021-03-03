module MeridianCircle(r, angle, pen, col)
{
    rotate([90, 0, angle])
    color(col)
    difference()
    {
        circle(r);
        circle(r - pen);
    }
}

module MeridianCircles(num, r, pen, col)
{
    angleStep = 360 / num;
    for (angle = [0 : angleStep : 180 - angleStep])
    {
        MeridianCircle(r, angle, pen, col);
    }
}

module LatitudeCircle(r, pos, pen, col)
{
    translate([0, 0, pos])
    color(col)
    difference()
    {
        circle(r);
        circle(r - pen);
    }
}

module LatitudeCircles(numHalf, R, pen, col, stepScale = 1)
{
    posStep = stepScale * R / numHalf;
    for (pos = [0 : posStep : stepScale * (R - posStep)] )
    {
        r = sqrt(pow(R, 2) - pow(pos, 2));
        LatitudeCircle(r, pos, pen, col);
        LatitudeCircle(r, -pos, pen, col);
    }
}

module Equator(R, pen, color)
{
    //LatitudeCircle(R, 0, pen, color);
    LatitudeCircles(20, R, pen, color, 0.025);
}

module RadiusHorizontal(R, pen, angle, color)
{
    rotate([0, 90, angle])
    translate([0, 0, R / 2 - pen / 2])
    color(color)
    cylinder(h = R - pen, r = pen, center = true);
}

module RadiusVertical(R, pen, angle, color)
{
    rotate([0, 0, 0])
    translate([0, 0, R / 2])
    color(color)
    cylinder(h = R - pen, r = pen, center = true);
}

// params
$fn = 100;
R = 500;
pen = 8;
numOfMC = 16;

// draw Earth
MeridianCircles(numOfMC, R, pen, "black");
LatitudeCircles(numOfMC / 2, R, pen, "black");
Equator(R, pen * 2, "red");
RadiusHorizontal(R, pen * 2, 15, "green");
RadiusVertical(R, pen * 2, 45, "blue");
