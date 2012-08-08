#!/usr/bin/perl -w
use strict;

my $dir = shift;
foreach my $trainsize(1..20) {
    `cat $dir/*/$trainsize.acc | cut -d" " -f6 >ttt01`;
    `cat $dir/*/$trainsize.stats |grep diameter | cut -d" " -f4 >ttt02`;
    `cat $dir/*/$trainsize.ttats |grep diameter | cut -d" " -f4 >ttt03`;
    `cat $dir/*/$trainsize.stats |grep average | grep degree | cut -d" " -f5 >ttt04`;
    `cat $dir/*/$trainsize.ttats |grep average | grep degree | cut -d" " -f5 >ttt05`;
    `cat $dir/*/$trainsize.stats |grep components | cut -d" " -f6 >ttt06`;
    `cat $dir/*/$trainsize.ttats |grep components | cut -d" " -f6 >ttt07`;
    `cat $dir/*/$trainsize.stats |grep Watts | cut -d" " -f9 >ttt08`;
    `cat $dir/*/$trainsize.ttats |grep Watts | cut -d" " -f9 >ttt09`;
    `cat $dir/*/$trainsize.stats |grep Newman |grep clustering | cut -d" " -f8 >ttt10`;
    `cat $dir/*/$trainsize.ttats |grep Newman |grep clustering | cut -d" " -f8 >ttt11`;
    `cat $dir/*/$trainsize.stats |grep Ferrer | cut -d" " -f8 >ttt12`;
    `cat $dir/*/$trainsize.ttats |grep Ferrer | cut -d" " -f8 >ttt13`;
    `cat $dir/*/$trainsize.stats |grep distance: | cut -d" " -f7  >ttt14`;
    `cat $dir/*/$trainsize.ttats |grep distance: | cut -d" " -f7  >ttt15`;
    `cat $dir/*/$trainsize.stats |grep full | cut -d" " -f7 >ttt16`;
    `cat $dir/*/$trainsize.ttats |grep full | cut -d" " -f7 >ttt17`;
    `paste ttt* >$dir/train$trainsize-double.table`;
    `rm  ttt*`;
}
