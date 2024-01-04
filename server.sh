#!/bin/sh

sed -i '/Game_LowViolence/a\Game    csgo/addons/metamod' "SERVERPATH/game/csgo/gameinfo.gi"

/home/steam/server/game/bin/linuxsteamrt64/cs2 -dedicated -usercon -console -secure -dev +game_type 0 +game_mode 1 +sv_logfile 1 -serverlogging +sv_setsteamaccount $SERVERTOKEN -port 27016 +map de_inferno +exec /home/steam/server/game/csgo/cfg/server.cfg