#!/usr/bin/perl -w
use strict;

my $supdir = shift;
my @subdirs = `ls $supdir`;
chomp(@subdirs);

foreach my $d (@subdirs) {
    my $dir = $supdir.'/'.$d;

    my @files_to_delete = `ls $dir/*/*pdf`;
    chomp (@files_to_delete);

    `rm $_` foreach (@files_to_delete);
}

