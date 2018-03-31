
   ## environment
    setenv LANG en_US.UTF-8
    setenv LC_ALL en_US.UTF-8
    setenv EDITOR vim
    setenv FTP_PASSIVE_MODE true
    setenv MYVIMRC ~/.vimrc
    setenv G_FILENAME_ENCODING @locale
    set catalog=ja.ayanami.cat
    if ( -d ~/.tcsh.d ) then
    setenv NLSPATH ~/.tcsh.d/%N
    endif
    setenv RLWRAP_HOME ~/.rlwrap
    setenv XDG_CACHE_HOME ~/.cache

    ## java
    #setenv CLASSPATH /usr/local/share/java/rhino
    setenv _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on'

  # for shellar
    setenv CURRENT_SHELL tcsh



    if ( -X lv) then
        setenv PAGER 'lv '
        setenv LV '-c -Sh1;36 -Su1;4;32 -Ss7;37;1;33'
    else if ( -X most) then
    setenv PAGER most
    endif
