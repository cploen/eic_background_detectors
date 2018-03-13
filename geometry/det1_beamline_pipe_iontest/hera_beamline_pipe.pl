#!/usr/bin/perl -w

use strict;
use lib ("/group/clas12/gemc/3a.1.0/source/api/perl");
use parameters;
use utils;

use geometry;
use hit;
use bank;
use math;

# Help Message
sub help()
{
	print "\n Usage: \n";
	print "   detector.pl <configuration filename>\n";
 	print "   Will create the detector\n";
 	print "   Note: The passport and .visa files must be present to connect to MYSQL. \n\n";
	exit;
}

# Make sure the argument list is correct
if( scalar @ARGV != 1)
{
	help();
	exit;
}


# Loading configuration file and paramters
our %configuration = load_configuration($ARGV[0]);
require "solid_hera_beamline_pipe.pl";
require "vac_hera_beamline_pipe.pl";
require "hera_beamline_pipe_materials.pl";

my @allConfs = (
"Hera",
"pipe_65Be_35Al",
"pipe_35Be_65Al",
"pipe_100Be",
"length_1.5", "length_3", "length_7",
"vac_L1", "vac_L2", "vac_L3", "vac_L4", "vac_L5", "vac_L6",
);

foreach my $conf ( @allConfs )
{
	$configuration{"variation"} = "$conf";

	#geometry
	build_solid_hera_beamline_pipe();
	build_vac_hera_beamline_pipe();
	define_material();
}
