#!/usr/bin/perl -w
use strict;
my %comparable_hash; # a hash of array refs
open IN, "train_classes2" or die;
while (<IN>) {
    chomp;
    my ($dir, $testsize, $test_cnt0, $test_cnt1, $trainsize, $train_cnt0, $train_cnt1) = split /\t/, $_;
    die "$_\n" if ($train_cnt0 * 3<= $train_cnt1 or $train_cnt0 / 3 >= $train_cnt1);
    my ($group_id, $sample_no) = split '/', $dir;
    my $key = $group_id."_".$trainsize."_".$train_cnt0;
    my $sample_id = $group_id."/".$sample_no."/".$trainsize; 
    $comparable_hash{$key} = [ ] if not exists  $comparable_hash{$key};
    push ( @{ $comparable_hash{$key} }, $sample_id);
}

foreach my $key (keys %comparable_hash) {
    my $cnt = $#{ $comparable_hash{$key} }+1;
    print $cnt."\t"; 
    print $key;
    foreach my $s_id ( @{ $comparable_hash{$key} } ){
        print "\t". $s_id;
    }
    print "\n";
}



