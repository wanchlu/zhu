#!/usr/bin/perl -w
use strict;

my $edgelist = shift;
my $trainsize = shift;

my %adj_matrix = ();
my %degree = ();
my $num_nodes = 0;

open IN, "$edgelist" or die;
while (<IN>) {
    chomp;
    my ($v1, $v2, $w) = split /\s+/;
    $adj_matrix{$v1}{$v2} = $w;
    $adj_matrix{$v2}{$v1} = $w;
    $num_nodes = $v1 if $num_nodes < $v1;
    $num_nodes = $v2 if $num_nodes < $v2;
    $degree{$v1} = 0 if not exists $degree{$v1};
    $degree{$v2} = 0 if not exists $degree{$v2};
    $degree{$v1} ++;
    $degree{$v2} ++;
}
close IN;

my $sum_degree = 0;
my $sum_coeff = 0;
for (my $i = 1; $i <= $trainsize; $i++) {
    # isolated
    next if not exists $degree{$i};
    if ($degree{$i} == 1) {
        $sum_degree += 1;
    } else {
        my $e_jk = 0;
        my @neighbors = keys %{$adj_matrix{$i}};
        foreach my $j (0..($#neighbors-1)) {
            foreach my $k (($j+1)..$#neighbors) {
                if (exists $adj_matrix{$neighbors[$j]}{$neighbors[$k]}) {
                    $e_jk ++;
                    #print $neighbors[$j]."-".$neighbors[$k]." ";
                }
            }
        }
        my $c = 2 * $e_jk / ($degree{$i} * ($degree{$i} - 1)) ;
        $sum_degree += $degree{$i};
        $sum_coeff += $c;
    }
}
my $avg_degree = $sum_degree /$trainsize;
my $avg_coeff = $sum_coeff /$trainsize;
print $avg_degree."\t".$avg_coeff;


