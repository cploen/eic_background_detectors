use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'det1_eleside_disc';

sub det1_eleside_disc
{
my $NUM  = 1;
my @z  = (8.00);
my @Rin = (0);
#my @Rin = (3.801/2);
my @Rout = (200/2);
#my $x=0;
my $x = (57.6);
my @rot=0;
my @name = ("1"); 
my @mother = ("$DetectorMother");
my @mat  = ("G4_Galactic");

for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      =  "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_[$n-1]";
    $detector{"pos"}         = "$x*mm 0*m $z[$n-1]*m";
    $detector{"rotation"}    = "0*rad $rot[$n-1]*rad 0*rad";
    $detector{"color"}       = "ff000f"; 
    $detector{"type"}        = "Tube";
    $detector{"dimensions"}  = "$Rin[$n-1]*cm $Rout[$n-1]*cm 0.15*cm 0*deg 360*deg";
    $detector{"material"}    = $mat[$n-1];
    $detector{"mfield"}      = "no";
    $detector{"ncopy"}       = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = "flux";
    $detector{"hit_type"}    = "flux";
#    $detector{"identifiers"} = $id[$n-1];
     print_det(\%configuration, \%detector);
 }
}
1;
