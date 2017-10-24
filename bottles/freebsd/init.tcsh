
if ( "${OSTYPE}" == "FreeBSD" ) then

    alias pcheck 'sudo portmaster -PBiydav && sudo portaudit -Fdav && sudo portmaster --clean-packages --clean-distfiles'
    alias pfetch 'sudo make fetch-recursive'
    alias pinst "sudo make -s clean reinstall clean distclean; rehash"
    alias pconf sudo make config
    alias pconfr sudo make config-recursive
    alias pclean 'sudo make clean '
    alias ppconf 'make pretty-print-config'
    alias psconf 'make showconfig'
    alias prmconf 'make rmconfig'
    alias puniname 'make -VUNIQUENAME'

    if ( -X portmaster ) then
        alias pm 'sudo portmaster -dBvy '
    endif

    if ( -X pkg_replace ) then
        alias prep sudo pkg_replace
    endif
    
setenv TZ Asia/Tokyo

endif
