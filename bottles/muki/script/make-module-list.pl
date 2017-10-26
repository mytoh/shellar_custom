#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use feature ":5.28";
use ExtUtils::Installed;
use feature qw(signatures);
use experimental qw(smartmatch signatures);

my sub print_modules ($args) {
  my $cpan = $args->[0] // 'default';
  given ($args->[0]) {
    when ('cpanfile') {
      say "requires '$_';" for ExtUtils::Installed->new->modules;
    }
    default {
      say  "$_" for ExtUtils::Installed->new->modules;
    }
  }
}

print_modules(\@ARGV);
