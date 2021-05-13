FROM debian:buster-slim
ARG PROFILE=release
COPY galital /usr/local/bin

RUN useradd -m -u 1000 -U -s /bin/sh -d /galital galital && \
	mkdir -p /galital/.local/share/galital && \
	chown -R galital:galital /galital/.local && \
	ln -s /galital/.local/share/galital /data && \
	rm -rf /usr/bin /usr/sbin

USER galital
EXPOSE 30333 9933 9944
VOLUME ["/data"]

CMD ["/usr/local/bin/galital"]