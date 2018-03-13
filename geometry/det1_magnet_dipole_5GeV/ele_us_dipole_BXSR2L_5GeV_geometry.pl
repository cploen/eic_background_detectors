use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'ele_us_dipole_BXSR2L_5GeV';


# this is for 5GeV ele beam energy configuration....

#length in m, halfaperture in cm, streng in T or T/m, X in m, Z in m, Theta in rad
#RBEND
my $e_us_BXSR2L_length                  = $parameters{"e_us_BXSR2L_length"};
my $e_us_BXSR2L_innerhalfaperture	= $parameters{"e_us_BXSR2L_innerhalfaperture"};
my $e_us_BXSR2L_outerhalfaperture	= $parameters{"e_us_BXSR2L_outerhalfaperture"};
my $e_us_BXSR2L_strength	      	= $parameters{"e_us_BXSR2L_strength"};
my $e_us_BXSR2L_X			= $parameters{"e_us_BXSR2L_X"};
my $e_us_BXSR2L_Z			= $parameters{"e_us_BXSR2L_Z"};
my $e_us_BXSR2L_Theta			= $parameters{"e_us_BXSR2L_Theta"};

sub ele_us_dipole_BXSR2L_5GeV 

{
my $NUM  =  1 +1+2;
my @name =(
"upstream_BXSR2L_outer",
"upstream_BXSR2L_inner",
"upstream_BXSR2L_front",
"upstream_BXSR2L_back",
);

my @mother = (
"$DetectorMother", 
"$DetectorName\_upstream_BXSR2L_outer",
"$DetectorName\_upstream_BXSR2L_inner",
"$DetectorName\_upstream_BXSR2L_inner",
);

my @mat  = (
"Vacuum",
"Vacuum", 
"Vacuum", 
"Vacuum", 
);

my @z    = (
$e_us_BXSR2L_Z, 
0, 
0.5*$e_us_BXSR2L_length-1e-10, 
-0.5*$e_us_BXSR2L_length+1e-10, 
    );

my @x    = (
$e_us_BXSR2L_X, 
0,
0, 
0, 
    );

my @Dx = (
$e_us_BXSR2L_outerhalfaperture,
$e_us_BXSR2L_innerhalfaperture, 
$e_us_BXSR2L_innerhalfaperture, 
$e_us_BXSR2L_innerhalfaperture, 
    );

my @Dy = (
$e_us_BXSR2L_outerhalfaperture, 
$e_us_BXSR2L_innerhalfaperture, 
$e_us_BXSR2L_innerhalfaperture, 
$e_us_BXSR2L_innerhalfaperture, 
    );


my @Dz   = (
0.5*$e_us_BXSR2L_length, 
0.5*$e_us_BXSR2L_length,
1e-10,
1e-10,
    );


my @rot  = (
-1*$e_us_BXSR2L_Theta,
0,
0,
0,
);
my @field = (
"no",
"det1_ele_us_BXSR2L_5GeV_simple",
"no",
"no",
);

my @color = (
"880000", 
"ffb6c1", 
"CDE6FA", 
"CDE6FA",  
);
my @sen = (
"no",
"no",
"flux",
"flux",
);
my @hit = (
"no",
"no",
"flux",
"flux",
);
my @id = (
"no",
"no",
"id manual 21411",
"id manual 21412",
);
#note naming gets a bit weird because n>9.  
# == id name ==========================================================================#
# digit     beamline                side          magnet      number          window   #
#        ion    1        upstream    1    dipole    1           n     front      1     #  
#        ele    2       downstream   2  quadrupole  2                 back       2     #
#                                       sextupole   3                                  #
#                                        r- bend    4                                  #
#                                        Maker      5                                  #
# =====================================================================================#



 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "$x[$n-1]*m 0*m $z[$n-1]*m";
    $detector{"rotation"}   = "0*rad $rot[$n-1]*rad 0*rad";
    $detector{"color"}      = $color[$n-1]; 
    $detector{"type"}       = "Box";
    $detector{"dimensions"} = "$Dx[$n-1]*cm $Dy[$n-1]*cm $Dz[$n-1]*m";
    $detector{"material"}   = $mat[$n-1];
    $detector{"mfield"}     = $field[$n-1];
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = $sen[$n-1];
    $detector{"hit_type"}    = $hit[$n-1];
    $detector{"identifiers"} = $id[$n-1];
     print_det(\%configuration, \%detector);
 }
}

