#!/usr/bin/perl -w
use strict;
my $script = "summarize_stats_to_table_dir.pl";

foreach my $i (1..9) {
    `./$script Sun0$i`
}
foreach my $i (10..50) {
    `./$script Sun$i`
}
