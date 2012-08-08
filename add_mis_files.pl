#!/usr/bin/perl -w
use strict;

my $dir = shift;

my @trainfiles = `ls $dir/*/*train`;
chomp(@trainfiles);


my $testfile = "$dir/0/test";
`./data/convert_to_zhu_format_single.pl $testfile`;
foreach my $file (@trainfiles) {
    my $trainfile = $file;
    `./data/convert_to_zhu_format_single.pl $trainfile`;
}

