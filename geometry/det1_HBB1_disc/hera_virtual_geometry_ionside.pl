use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'hera_virtual_ionside_c5';

sub hera_virtual_ionside_c5
{
my $NUM  = 2;
my @z  = (11.24,11.26);
my @Rin = (3.801/2,3.801/2);
my @Rout = (20/2,20/2);
my $x=0;
my @rot=(0.,0.);
my @name = ("1","2"); 
my @mother = ("$DetectorMother","$DetectorMother");
my @mat  = ("Scintillator","Scintillator");

my @id = ("id manual 12311","id manual 12321");

# == id name ==============================================================
# digit     beamline                side          magnet      number          window
#        ion    1        upstream    1    dipole    1           n     front      1
#        ele    2       downstream   2  quadrupole  2                 back       2
#                                          virtual  3
# =========================================================================


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
    $detector{"identifiers"} = $id[$n-1];
     print_det(\%configuration, \%detector);
 }
}
1;
