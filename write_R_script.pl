#!/usr/bin/perl -w
use strict;

open IN, "R_output/list_of_big_tables" or die;
while (<IN>) {
    chomp;
    s/big//g;
    my $num = $_;
    print " if (length (lsgrep(\"t$num\_.*\") > 0) ) {\n";
    print "\tbig$num=my_cat_table_rows_by_table_name_regex(\"t$num\_.*\")\n";
    print "\twrite.table(big$num, \"R_output/big$num.table\", quote=FALSE, sep=\"\\t\", col.names=FALSE, row.names=FALSE)\n";
    print "\trmgrep(\"t$num\_.*\")\n";
    print "}\n";
}

