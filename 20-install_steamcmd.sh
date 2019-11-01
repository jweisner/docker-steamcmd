if [ ! -x /home/steam/linux32/steamcmd ];then
    echo Installing steamcmd...
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxf -
fi

/home/steam/steamcmd.sh +quit
