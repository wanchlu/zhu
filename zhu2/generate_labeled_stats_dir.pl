#!/usr/bin/perl -w
use strict;

my $supdir = shift;
my @subdirs = `ls $supdir`;
chomp(@subdirs);

foreach my $d (@subdirs) {
    next unless ($d =~ m/^train(\d+)test/);
    my $trainsize = $1;
    my $dir = $supdir.'/'.$d;

    my @files_to_process = `ls $dir/*/sim`;
    chomp (@files_to_process);
    foreach my $file (@files_to_process) {
        my $output = $file;
        $output =~ s/sim/labeled/g;
        `./labeled_degree_clustering_coeff.pl $file $trainsize >$output`;
    }

}

