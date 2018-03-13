use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'vac_hera_beamline_pipe';

sub build_vac_hera_beamline_pipe
{
my $NUM  = 3;
my @name=(
"IonBeamPipeVolume1",
"IonBeamPipeVolume2",
"IonBeamPipeVolume3",
);
my @mother = (
"$DetectorMother",
"$DetectorMother",
"$DetectorMother",
);
my @mat0  = (
#HERA "good" vac region set to vacuum_low as per KJP script;
#affects all mat variables
"vacuum_low",
"vacuum_h2",
"vacuum_low",
);

my @mat1  = (
"vacuum_low",
"vacuum_h2_L1",
"vacuum_low",
);

my @mat2  = (
"vacuum_low",
"vacuum_h2_L2",
"vacuum_low",
);

my @mat3  = (
"vacuum_low",
"vacuum_h2_L3",
"vacuum_low",
);

my @mat4  = (
"vacuum_low",
"vacuum_h2_L4",
"vacuum_low",
);

my @mat5  = (
"vacuum_low",
"vacuum_h2_L5",
"vacuum_low",
);

my @mat6  = (
"vacuum_low",
"vacuum_h2_L6",
"vacuum_low",
);

#Hera length config
my @z0    = (
2.5,
10,
17.5,
);

#Length_1.5 config
my @z1    = (
8.5/2,
10,
11.5 + 8.5/2,
);

#Length_3 config
my @z2    = (
7/2,
10,
13 + 7/2,
);

#Length_7 configmy @z0
my @z3    = (
3/2,
10,
17 + 3/2,
);

#Hera length config
my @Dz0    = (
5/2,
9.998/2,
5/2,
);

#Length_1.5 config
my @Dz1    = (
8.5/2,
2.998/2,
8.5/2,
);

#Length_3 config
my @Dz2    = (
7/2,
5.998/2,
7/2,
);

#Length_7 config
my @Dz3    = (
3/2,
13.998/2,
3/2,
);

my @Rin  = (
0,
0,
0,
);

my @Rout  = (
38/2-0.001,
38/2-0.001,
38/2-0.001,
);

my @rot  = (
0,
0,
0,
);
my @color = (
"000000", #black
"f5ecd9", #lt pink
"000000",
);
#It should be 6 or 7 digits  rrggbb[t]  (red, green, blue hexadecimals + optional transparency).

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"rotation"}    = "0*rad $rot[$n-1]*rad 0*rad";
    $detector{"color"}       = $color[$n-1];
    $detector{"type"}        = "Tube";
    $detector{"mfield"}      = "no";
    $detector{"ncopy"}       = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = "no";
    $detector{"hit_type"}    = "no";
    $detector{"identifiers"} = "no";


    if($configuration{"variation"} eq "Hera" or $configuration{"variation"} eq "pipe_65Be_35Al" or $configuration{"variation"} eq "pipe_35Be_65Al" or $configuration{"variation"} eq "pipe_100Be")
    {
          $detector{"material"}   = $mat0[$n-1];
          $detector{"pos"}         = "0*m 0*m $z0[$n-1]*m";
          $detector{"dimensions"}  = "$Rin[$n-1]*mm $Rout[$n-1]*mm $Dz0[$n-1]*m 0*deg 360*deg ";
    }

    if($configuration{"variation"} eq "vac_L1")
    {
          $detector{"material"}   = $mat1[$n-1];
          $detector{"pos"}         = "0*m 0*m $z0[$n-1]*m";
          $detector{"dimensions"}  = "$Rin[$n-1]*mm $Rout[$n-1]*mm $Dz0[$n-1]*m 0*deg 360*deg ";

    }

    if($configuration{"variation"} eq "vac_L2")
    {
          $detector{"material"}   = $mat2[$n-1];
          $detector{"pos"}         = "0*m 0*m $z0[$n-1]*m";
          $detector{"dimensions"}  = "$Rin[$n-1]*mm $Rout[$n-1]*mm $Dz0[$n-1]*m 0*deg 360*deg ";

    }

    if($configuration{"variation"} eq "vac_L3")
    {
          $detector{"material"}   = $mat3[$n-1];
          $detector{"pos"}         = "0*m 0*m $z0[$n-1]*m";
          $detector{"dimensions"}  = "$Rin[$n-1]*mm $Rout[$n-1]*mm $Dz0[$n-1]*m 0*deg 360*deg ";

    }

    if($configuration{"variation"} eq "vac_L4")
    {
          $detector{"material"}   = $mat4[$n-1];
          $detector{"pos"}         = "0*m 0*m $z0[$n-1]*m";
          $detector{"dimensions"}  = "$Rin[$n-1]*mm $Rout[$n-1]*mm $Dz0[$n-1]*m 0*deg 360*deg ";

    }

    if($configuration{"variation"} eq "vac_L5")
    {
          $detector{"material"}   = $mat5[$n-1];
          $detector{"pos"}         = "0*m 0*m $z0[$n-1]*m";
          $detector{"dimensions"}  = "$Rin[$n-1]*mm $Rout[$n-1]*mm $Dz0[$n-1]*m 0*deg 360*deg ";
    }

    if($configuration{"variation"} eq "vac_L6")
    {
          $detector{"material"}   = $mat6[$n-1];
          $detector{"pos"}         = "0*m 0*m $z0[$n-1]*m";
          $detector{"dimensions"}  = "$Rin[$n-1]*mm $Rout[$n-1]*mm $Dz0[$n-1]*m 0*deg 360*deg ";
    }

    if($configuration{"variation"} eq "length_1.5")
    {
          $detector{"material"}   = $mat0[$n-1];
          $detector{"pos"}         = "0*m 0*m $z1[$n-1]*m";
          $detector{"dimensions"}  = "$Rin[$n-1]*mm $Rout[$n-1]*mm $Dz1[$n-1]*m 0*deg 360*deg ";
    }

    if($configuration{"variation"} eq "length_3")
    {
          $detector{"material"}   = $mat0[$n-1];
          $detector{"pos"}         = "0*m 0*m $z2[$n-1]*m";
          $detector{"dimensions"}  = "$Rin[$n-1]*mm $Rout[$n-1]*mm $Dz2[$n-1]*m 0*deg 360*deg ";
    }

    if($configuration{"variation"} eq "length_7")
    {
          $detector{"material"}   = $mat0[$n-1];
          $detector{"pos"}         = "0*m 0*m $z3[$n-1]*m";
          $detector{"dimensions"}  = "$Rin[$n-1]*mm $Rout[$n-1]*mm $Dz3[$n-1]*m 0*deg 360*deg ";
    }

     print_det(\%configuration, \%detector);
 }
}
1;
#Hera
#"length_1.5", "length_3", "length_7",
#"vac_L1", "vac_L2", "vac_L3", "vac_L4", "vac_L5", "vac_L6",
