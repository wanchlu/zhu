#!/usr/bin/perl -w
use strict;

open IN, "comparable_groups1.txt" or die;
while (<IN>) {
    chomp;
    my @tokens = split /\t/, $_;
    my $sample_size = $tokens[0];
    my $cgid = $sample_size."-".$tokens[1];
    `mkdir -p comparable_groups/$cgid`;

    foreach my $i (2..$#tokens) {
        my $sample_id = $tokens[$i];
        my ($group_id, $sample_no, $trainsize) = split '/', $sample_id;
        `mkdir -p comparable_groups/$cgid/$sample_no`;
        `cp $group_id/test* comparable_groups/$cgid` if ($i == 2);

        `cp $group_id/$sample_no/$trainsize.acc $group_id/$sample_no/$trainsize.dot $group_id/$sample_no/$trainsize.pdf $group_id/$sample_no/$trainsize.sim $group_id/$sample_no/$trainsize.stats $group_id/$sample_no/$trainsize.ttats $group_id/$sample_no/$trainsize.train $group_id/$sample_no/$trainsize.out -t comparable_groups/$cgid/$sample_no`;
    }
}




