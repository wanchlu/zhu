#!/usr/bin/perl -w
use strict;

foreach my $i (10..50) {
    `./generate_dot_dir.pl Sun$i`
}
