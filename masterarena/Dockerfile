FROM debian:bookworm-20220527

RUN apt-get update && apt-get install \
        ca-certificates \
        locales \
        curl \
        wget \
        tar \
        python3 \
        wine \
        xserver-xorg-video-dummy \
        dos2unix -y

        RUN apt-get install software-properties-common -y && \
            add-apt-repository non-free && \
            dpkg --add-architecture i386 && \
            apt-get update && \
            apt-get install libc6-i386 lib32gcc-s1 lib32stdc++6 wine32 -y

            RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen

            RUN dpkg-reconfigure --frontend=noninteractive locales

# symlink libraries so misconfigured dedicated servers can find it

            RUN ln -s "~/steamcmd/linux64/steamclient.so" "/usr/lib/x86_64-linux-gnu/steamclient.so"

# create a group to run the gameserver on
# RUN addgroup \
# --system --gid 1000 gameserver
# RUN useradd \
# -u 1000 \
# -g gameserver \
# -ms /bin/bash gameserver

# USER gameserver:gameserver

            RUN mkdir -p /root/.steam/root/compatibilitytools.d

            WORKDIR /root/

            COPY ./ .

            RUN chmod +x ./steamcmd-guardian.sh

            RUN dos2unix ./steamcmd-guardian.sh

# RUN wget https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton7-20/GE-Proton7-20.tar.gz -O proton-ge.tar.gz

# RUN tar -xvzf proton-ge.tar.gz -C /root/.steam/root/compatibilitytools.d/

            EXPOSE 7787/udp
            EXPOSE 27016/udp
            ENTRYPOINT ["/bin/bash", "-C", "./entrypoint.sh"]
