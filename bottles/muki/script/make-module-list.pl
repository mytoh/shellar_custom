#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use ExtUtils::Installed;
use feature qw(say signatures);
use experimental qw(signatures);

my sub print_modules ($args) {
  my $cpan = $args->[0] // 'default';
  if ($cpan eq 'cpanfile') {
    say "requires '$_';" for ExtUtils::Installed->new->modules;
  } elsif ($cpan eq 'default') {
    say  "$_" for ExtUtils::Installed->new->modules;
  }
}

print_modules(\@ARGV);
