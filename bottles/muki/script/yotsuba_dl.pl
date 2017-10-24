#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use File::chdir;
use File::HomeDir;
use File::Spec::Functions;
use feature qw/say switch signatures/;
use experimental qw(switch  signatures);

my sub yotsuba ($dir) {
  my @children = qw(huone kuvat sivusto 4chan);
  local $CWD = catdir(File::HomeDir->my_home, @children, $dir);
  system 'yotsuba', '-a', $dir;
}


my sub main ($dirs) {
  while (1) {

    foreach my $i ($dirs->@*) {
      say $i;
      yotsuba $i;
    }

    say "sleeping...";
    sleep 300;
  }

}

my $targets = [qw(trash w wg g)];
main( $targets);
