#!/usr/bin/perl -w

use strict;
# use warnings;
use lib ("$ENV{GEMC}/api/perl");
use lib ("$ENV{GEMC}/io");
use lib ("./api/perl");
use parameters;
use utils;
use geometry;
use hit;
use bank;
use math;

use Getopt::Long;
use Math::Trig;

my $config_file   = $ARGV[0];
our %configuration = load_configuration($config_file);

# One can change the "variation" here if one is desired different from the config.dat
$configuration{"detector_name"} = "../geometry/5GeV_dipole/ele_us_dipole_BXSR2L_5GeV";
$configuration{"variation"} = "Original";

# To get the parameters proper authentication is needed.
our %parameters    = get_parameters(%configuration);

# this is my first try at a field script for rbend (dipole) in EIC electron upstream.

#length in m, halfaperture in cm, streng in T or T/m, X in m, Z in m, Theta in rad
my $e_us_BXSR2L_length			= $parameters{"e_us_BXSR2L_length"};
my $e_us_BXSR2L_innerhalfaperture	= $parameters{"e_us_BXSR2L_innerhalfaperture"};
my $e_us_BXSR2L_outerhalfaperture	= $parameters{"e_us_BXSR2L_outerhalfaperture"};
my $e_us_BXSR2L_strength		= $parameters{"e_us_BXSR2L_strength"};
my $e_us_BXSR2L_X			= $parameters{"e_us_BXSR2L_X"};
my $e_us_BXSR2L_Z			= $parameters{"e_us_BXSR2L_Z"};
my $e_us_BXSR2L_Theta			= $parameters{"e_us_BXSR2L_Theta"};

# my $file = $configuration{"detector_name"}."__geometry_".$varia.".txt";

my $NUM=1;
my @file = (
"det1_ele_us_BXSR2L_5GeV_simple",
);

my @Npole=(
2,
);

my @scale=(
$e_us_BXSR2L_strength,
);

my @x=(
$e_us_BXSR2L_X,
);
my @z=(
$e_us_BXSR2L_Z,
);
my @rot=(
$e_us_BXSR2L_Theta,
);

for(my $n=0; $n<$NUM; $n++)
{
my $filename=sprintf("%s.dat",$file[$n]);
`rm -f $filename`;
print "Overwriting if existing: ", $filename, "\n";
open(INFO, ">>$filename");
printf INFO ("<mfield>\n");
printf INFO ("<description name=\"%s\" factory=\"ASCII\" comment=\"%s\"/>\n",$file[$n],$file[$n]);
printf INFO ("<symmetry type=\"multipole\" format=\"simple\" integration=\"RungeKutta\" minStep=\"1*mm\"/>\n");
printf INFO ("<dimension Npole=\"%i\" scale=\"%s\" Bunit=\"T\" x=\"%s\" y=\"0\" z=\"%s\" XYZunit=\"m\" rot=\"%s\" ROTunit=\"rad\" ROTaxis=\"Y\"/>\n",$Npole[$n],$scale[$n],$x[$n],$z[$n],$rot[$n]);
printf INFO ("<mfield>\n");
close(INFO);
}
