#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);
use autodie;

my $dict = '/usr/share/dict/words';
my @c = @ARGV;
my $middle = $c[0];
my $re = make_regex(@c);

open my $fh, '<', $dict;
while (<$fh>) {
    chomp;
    next unless length >= 4;
    next unless /$middle/;
    next if /$re/;
    say;
}

sub make_regex(@c) {
    my $letters = join "", @c;
    return qr([^$letters]);
}
