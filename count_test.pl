#!/usr/bin/perl -w
use strict;

my @ls = `ls .`;
chomp (@ls);
print "directory\ttestsize\ttest_0\ttest_1\n";
foreach my $f (@ls) {
    next unless ($f =~ m/Jul/);
    my $total_cnt = `cat "$f/1/test" | wc -l`;
    my $cnt0 = ` grep "^0" "$f/1/test" | wc -l`; 
    my $cnt1 = ` grep "^1" "$f/1/test" | wc -l`; 
    chomp ($cnt0);
    chomp ($cnt1);
    chomp ($total_cnt);
    $cnt0 =~ s/^\s+//g;
    $cnt1 =~ s/^\s+//g;
    $total_cnt =~ s/^\s+//g;
    print $f."\t".$total_cnt."\t".$cnt0."\t".$cnt1."\n";
}
