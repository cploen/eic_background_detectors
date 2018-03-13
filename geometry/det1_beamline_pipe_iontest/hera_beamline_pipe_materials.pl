#!/usr/bin/perl -w
###################################################################
# This script defines all materials used in the simulation.       #
# If a new material is added, please specify your name, date and  #
# the purpose of adding this. Please make sure all materials      #
# have their names started with SL_*                              #
#
# Note: G4_* are for materials, so use percentage
#       For components,like C9H10, use the element "C" but not "G4_C"
#                                                                 #
###################################################################

############
#Note:
# (0) Define your new material in the section it belongs to,
#     DO-NOT just simply add it to the end of the file.
#     Put your name and date near where you define your new items.
# (1) Pay attention to the density unit, which should be g/cm3
# (2) For elements, they should be like "He","C", ...
#     For materials, they should be like "G4_He", "G4_C"
# (3) "SL_NewMaterial" is the newly defined material for SoLID
# (4) If the new material is composed of elements,
#     use "integer" to define the number of elements,
#     e.g "H 2 O 1"
# (5) If the new material is mixers of other materials,
#     use "mass fraction" to define the components,
#     e.g. "G4_Si 0.70 G4_O 0.30"
# (6) When you define a new material mixed by other materials,
#     pay attention to how they are mixed,
#     e.g. by "mass fraction" or by "mole fraction" or volumn etc.
#

use strict;
use lib ("/group/clas12/gemc/3a.1.0/source/api/perl");
use utils;
use materials;

# Help Message
sub help()
{
	print "\n Usage: \n";
	print "   this_script.pl <configuration filename>\n";
 	print "   Will create materials used in HERA Benchmark\n";
	exit;
}

# Make sure the argument list is correct
# If not pring the help
if( scalar @ARGV != 1)
{
	help();
	exit;
}

# Loading configuration file from argument
our %configuration = load_configuration($ARGV[0]);

sub define_material
{
my $NUM = 11;

my @name = (
"pipe_65Be_35Al",
"pipe_35Be_65Al",
"vacuum_low",
"vacuum_high",
"vacuum_h2",
"vacuum_h2_L1",
"vacuum_h2_L2",
"vacuum_h2_L3",
"vacuum_h2_L4",
"vacuum_h2_L5",
"vacuum_h2_L6",
);

#in g/cm3
my @density = (
"2.16", #in g/cm3
"2.40",
"1.e-10",
"1.e-13",
"1.e-3",
"0.5e-3",
"0.2e-3",
"0.1e-3",
"0.05e-3",
"0.02e-3",
"0.01e-3",
);

my @ncomponents = (
"2",
"2",
"2",
"1",
"1",
"1",
"1",
"1",
"1",
"1",
"1",
);

my @components = (
"G4_Be 0.65 G4_Al 0.35",
"G4_Be 0.35 G4_Al 0.65",
"G4_N 0.70 G4_O 0.30",
"G4_H 1.0",
"G4_H 1.0",
"G4_H 1.0",
"G4_H 1.0",
"G4_H 1.0",
"G4_H 1.0",
"G4_H 1.0",
"G4_H 1.0",
);

for(my $n=1; $n<=$NUM; $n++)
{

	my %mat = init_mat();

	##############
	#builds various vacuums
	#
	$mat{"name"}          = "$name[$n-1]";
	$mat{"description"}   = "$name[$n-1]";
	$mat{"density"}       = "$density[$n-1]";  #in g/cm3
	$mat{"ncomponents"}   = "$ncomponents[$n-1]";
	$mat{"components"}    = "$components[$n-1]";
	print_mat(\%configuration, \%mat);
	}
}
define_material();
1;
