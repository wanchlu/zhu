#!/usr/bin/perl -w
use strict;

my @ls = `ls .`;
chomp (@ls);
print "directory\ttestsize\ttest_0\ttest_1\ttrainsize\ttrain_0\ttrain_1\n";
foreach my $f (@ls) {
    next unless ($f =~ m/Jul/);
    my $testfile = "$f/test";
    my $test_total_cnt = `cat $testfile | wc -l`;
    my $test_cnt0 = ` grep "^0" $testfile | wc -l`; 
    my $test_cnt1 = ` grep "^1" $testfile | wc -l`; 
    chomp ($test_cnt0);
    chomp ($test_cnt1);
    chomp ($test_total_cnt);

    my @sub_dirs = `ls $f`;
    chomp (@sub_dirs);
    foreach my $subdir (@sub_dirs) {
        next unless (-d "$f/$subdir");
        my @train_files = `ls $f/$subdir/*train`;
        chomp (@train_files);

        foreach my $trainfile (@train_files) {
            my $total_cnt = `cat $trainfile | wc -l`;
            my $cnt0 = ` grep "^0" $trainfile | wc -l`; 
            my $cnt1 = ` grep "^1" $trainfile | wc -l`; 
            chomp ($cnt0);
            chomp ($cnt1);
            chomp ($total_cnt);
            $cnt0 =~ s/^\s+//g;
            $cnt1 =~ s/^\s+//g;
            $total_cnt =~ s/^\s+//g;
            print "$f/$subdir"."\t".$test_total_cnt."\t".$test_cnt0."\t".$test_cnt1."\t".$total_cnt."\t".$cnt0."\t".$cnt1."\n";
        }
    }
}
