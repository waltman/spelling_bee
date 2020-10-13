#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);
use autodie;

my $dict = '/usr/share/dict/american-english-large';
my @c = split //, $ARGV[0];
my $middle = $c[0];
my $re = make_regex(@c);

open my $fh, '<', $dict;
while (<$fh>) {
    chomp;
    next unless length >= 4;
    next unless /$middle/;
    next if /$re/;
    say is_pangram($_) ? "$_ (pangram)" : $_;
}

sub make_regex(@c) {
    my $letters = join "", @c;
    return qr([^$letters]);
}

sub is_pangram($s) {
    my %h = map {$_ => 1} split //, $s;
    return scalar keys %h == 7;
}

