#!/usr/bin/perl -w
use strict;

foreach my $num (2..20) {
    print " if (length (lsgrep(\"big$num\_.*\") > 0) ) {\n";
    print "\thuge$num=my_cat_table_rows_by_table_name_regex(\"big$num\_.*\")\n";
    print "\twrite.table(huge$num, \"R_output/huge$num.table\", quote=FALSE, sep=\"\\t\", col.names=FALSE, row.names=FALSE)\n";
    #print "\trmgrep(\"big$num\_.*\")\n";
    print "}\n";
}

