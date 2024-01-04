FROM cm2network/steamcmd

ARG STEAMUSER
ARG STEAMPASS
ARG CFGPATH
ARG SERVERPATH

USER steam

RUN mkdir ${SERVERPATH} 
RUN ./steamcmd.sh +force_install_dir ../server/ +login ${STEAMUSER} ${STEAMPASS} +app_update 730 validate +quit

COPY server.cfg ${SERVERPATH}/${CFGPATH}/server.cfg
COPY server.sh ${SERVERPATH}/server.sh
COPY addons ${SERVERPATH}/game/csgo/addons

RUN /home/steam/steamcmd/steamcmd.sh +force_install_dir ${SERVERPATH} +login ${STEAMUSER} ${STEAMPASS} +app_update 730 validate +quit

CMD ["/home/steam/server/server.sh"]

# ENTRYPOINT ["tail", "-f", "/dev/null"]