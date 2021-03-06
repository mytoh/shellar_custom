
## Installing perlbrew
# perlbrew is installed: ~/perl5/perlbrew/bin/perlbrew

# perlbrew root (~/perl5/perlbrew) is initialized.

# Append the following piece of code to the end of your ~/.tcshrc and start a
# new shell, perlbrew should be up and fully functional from there:

# perlbrew  install --notest --64int --thread --clang --ld --multi -D useshrplib blead
# perlbrew  switch blead
# perlbrew lib create dev
# perlbrew switch perl-blead@dev 
# perlbrew install-cpanm
if ( -f ~/perl5/perlbrew/etc/cshrc ) then
  source ~/perl5/perlbrew/etc/cshrc
endif


alias pb perlbrew
alias pb-blead "pb --yes uninstall perl-blead; perlbrew --yes install-cpanm; rehash; cpanm Daiku; dk build:blead; perlbrew clean; perlbrew --yes install-cpanm; pb switch blead@dev && cpanm Daiku ; dk cpm:dotperl; dk cpm:global ; dk 'cpm:cpanfile[time reply critics app fast]'"
alias pb-latest "pb --yes uninstall perl-latest; perlbrew --yes install-cpanm; rehash; cpanm Daiku; dk build:latest ; perlbrew clean; perlbrew --yes install-cpanm;  pb switch latest@dev && cpanm Daiku ; dk cpm:dotperl; dk cpm:global ; dk 'cpm:cpanfile[time reply critics app fast]'"
