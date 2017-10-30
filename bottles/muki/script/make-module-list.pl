#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use feature ":5.28";
use ExtUtils::Installed;
use experimental qw(signatures);

my sub print_modules ($args) {
  my $cpan = $args->[0] // 'default';
  if ($args->[0] eq 'cpanfile') {
    say "requires '$_';" for ExtUtils::Installed->new->modules;
  } else {
    say  "$_" for ExtUtils::Installed->new->modules;
  }
}

print_modules(\@ARGV);
