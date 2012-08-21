#!/usr/bin/perl -w
use strict;
open IN, "train_classes" or die;
open OUT, ">train_classes_biased_samples" or die;
while (<IN>) {
    chomp;
    my ($dir, $testsize, $test_cnt0, $test_cnt1, $trainsize, $train_cnt0, $train_cnt1) = split /\t/, $_;
    if ($train_cnt0 eq '0' or $train_cnt1 eq '0') {
        print OUT "$_\n";
        `rm -f $dir/$trainsize.acc $dir/$trainsize.dot $dir/$trainsize.pdf $dir/$trainsize.sim $dir/$trainsize.stats $dir/$trainsize.ttats $dir/$trainsize.train $dir/$trainsize.out`;
    }
    elsif ($train_cnt0 * 3 <= $train_cnt1 or $train_cnt0 / 3 >= $train_cnt1 ) {
        print OUT "$_\n";
        `rm -f $dir/$trainsize.acc $dir/$trainsize.dot $dir/$trainsize.pdf $dir/$trainsize.sim $dir/$trainsize.stats $dir/$trainsize.ttats $dir/$trainsize.train $dir/$trainsize.out`;
    } else {
        print "$_\n";
    }
}
