FROM osrg/ryu

RUN \
  apt-get update && \
  apt-get install -qy --no-install-recommends \
    libpython2.7-dev \
    libyaml-dev \
    python-pip

COPY ./ /faucet-src/

RUN \
  pip install /faucet-src

VOLUME ["/etc/ryu/faucet/", "/var/log/ryu/faucet/"]
WORKDIR /usr/local/lib/python2.7/dist-packages/ryu_faucet/org/onfsdn/faucet/

EXPOSE 6633

CMD ["ryu-manager", "--ofp-tcp-listen-port=6633", "faucet"]
