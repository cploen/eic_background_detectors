use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;

use Getopt::Long;
use Math::Trig;

sub build_solid_hera_beamline_pipe
{
    my %detector=init_det();
    $detector{"name"}        = "solid_hera_beamline_pipe";
    $detector{"mother"}      = "root" ;
    $detector{"description"} = "Beam Pipe";
    $detector{"pos"}        = "0*m 0*m 10*m";
    $detector{"rotation"}   = "0*rad 0*rad 0*rad";
    #$detector{"material"}   = "pipe_65Be_35Al";
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "19*mm 19.5*mm 10*m 0*deg 360*deg";
    #$detector{"color"}         = "ffff00";
    $detector{"mfield"}     = "no";
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = "no";
    $detector{"hit_type"}    = "no";
    $detector{"identifiers"} = "no";


     if($configuration{"variation"} eq "pipe_65Be_35Al")
     {
       $detector{"material"}   = "pipe_65Be_35Al";
       $detector{"color"}      = "ffff00";
     }

     elsif($configuration{"variation"} eq "pipe_35Be_65Al")
     {
       $detector{"material"}   = "pipe_35Be_65Al";
       $detector{"color"}      = "ffb6c1";
     }

     elsif($configuration{"variation"} eq "pipe_100Be")
     { 
       $detector{"material"}   = "G4_Be";
       $detector{"color"}      = "ffb6c1";                 
     }                                        

     else{
       $detector{"material"}   = "G4_Al";
       $detector{"color"}      = "880000";
    }

    print_det(\%configuration, \%detector);

    }

    #if($configuration{"variation"} eq "Hera" or $configuration{"variation"} eq "length_1.5"
    #or $configuration{"variation"} eq "length_3" or $configuration{"variation"} eq "length_7"
    #or $configuration{"variation"} eq "vac_L1" or $configuration{"variation"} eq  "vac_L2"
    #or $configuration{"variation"} eq "vac_L3" or $configuration{"variation"} eq "vac_L4"
    #or $configuration{"variation"} eq  "vac_L5" or $configuration{"variation"} eq  "vac_L6")
1;
