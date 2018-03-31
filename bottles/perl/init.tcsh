 # setenv PERL5LIB ~/.shellar_custom/bottles/perl/lib:$PERL5LIB

 if ( ! ${?PERL_MUKI_LIB}) then
setenv PERL_MUKI_LIB  $HOME/.perl/lib 
setenv PERL5LIB `${HOME}/.perl/script/add-to-env.pl $PERL_MUKI_LIB PERL5LIB`
    set -f path=(${HOME}/.perl/script ${path})
 endif

 setenv HARNESS_OPTIONS j3

setenv PERL_STRICTURES_EXTRA 0

 # alias reply 'rlwrap reply'
 alias reply 'rlwrap -A -pcyan reply'


 if ( -X mcpandoc ) then
     alias pd 'mcpandoc '
     alias pdf 'mcpandoc -f '
     alias perldoc 'mcpandoc '
  else if ( -X cpandoc ) then
     alias pd 'mcpandoc '
     alias pdf 'mcpandoc -f '
     alias perldoc 'mcpandoc '
 endif


alias ci 'carton install'
alias ce 'carton exec -- '
alias ce 'carton update'

alias dk "daiku -f ~/Daikufile "

# [[https://boards.4chan.org/g/thread/65052204][/g/ - The logical conclusion to programming. - Technology - 4chan]]
alias ips 'rlwrap -A -pcyan -S "perl> " perl -wnE '\''say eval()//$@'\'
