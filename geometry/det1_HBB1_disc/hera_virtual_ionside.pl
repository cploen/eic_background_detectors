#!/usr/bin/perl -w

use strict;
use lib ("$ENV{GEMC}/api/perl");
use parameters;
use utils;

use geometry;
use hit;
use bank;
use math;

use Math::Trig;
# use Math::MatrixReal;
# use Math::VectorReal;

# system("rm det1_virtual_ionside__*txt");

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
my $config_file   = $ARGV[0];
our %configuration = load_configuration($config_file);

#if($#ARGV < 0){
#    do 'configs/pvdis_CLEO_nominal.pl';
#}else{
#    do 'configs/'.$ARGV[0];
#}

# One can change the "variation" here if one is desired different from the config.dat
$configuration{"detector_name"} = "hera_virtual_ionside_c5";
$configuration{"variation"} = "Original";
# $configuration{"variation"} = "Compton";
#$configuration{"variation"} = "ZDC";
#$configuration{"variation"} = "ALL"; # implement all detector component + beamlines

# To get the parameters proper authentication is needed.
# our %parameters    = get_parameters(%configuration);
#our %parameters    = get_parameters(%configuration);
#$configuration{"detector_name"} = "det1_virtual_ionside";

##############################################################################
require "hera_virtual_geometry_ionside.pl";
hera_virtual_ionside_c5();

require "materials.pl";
define_material();

1;

