#!/usr/bin/env perl
#===============================================================================
#
#         FILE: test.pl
#
#        USAGE: ./test.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2017/12/6 10:20:30
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;


my @hello=(3,4,5);
my $count=1;

foreach my $tf ( @hello ) {
    print "$tf\n";
}

$hello[4]=7;
$hello[9]=9;

foreach my $tf2 ( @hello ) {
    print "$tf2\n";
}


$count=$count+1;

print "$count\n";
