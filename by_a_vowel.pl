#!/usr/bin/env perl
use v5.36;
use autodie;

my $dict = '/usr/share/dict/american-english-huge';
my @c = split //, lc $ARGV[0];

open my $fh, '<', $dict;
while (<$fh>) {
    chomp;
    next unless length == @c + 1;
    my $sorted = join '', sort split //;
    for my $v (qw(a e i o u)) {
        my $test = join '', sort (@c, $v);
        say if $test eq $sorted;
    }
}
