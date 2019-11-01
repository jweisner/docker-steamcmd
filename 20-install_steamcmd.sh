if [ ! -x /home/steam/steamcmd/linux32/steamcmd ];then
    echo Installing steamcmd...
    cd /home/steam/steamcmd
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxf -
    cd
fi

/home/steam/steamcmd/steamcmd.sh +quit
