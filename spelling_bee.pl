#!/usr/bin/env perl
use v5.36;
use autodie;

my $dict = '/usr/share/dict/american-english-huge';
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
    return 0 if length($s) < 7;
    my %h = map {$_ => 1} split //, $s;
    return scalar keys %h == 7;
}

