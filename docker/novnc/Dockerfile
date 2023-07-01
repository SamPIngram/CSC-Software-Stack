FROM alpine:3.18

# Setup demo environment variables
ENV HOME=/root \
	DEBIAN_FRONTEND=noninteractive \
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8 \
	LC_ALL=C.UTF-8 \
	DISPLAY=:0.0 \
	DISPLAY_WIDTH=1920 \
	DISPLAY_HEIGHT=1080

# Install git, supervisor, VNC, & X11 packages
RUN apk --update --upgrade add \
	bash \
	fluxbox \
	git \
	socat \
	supervisor \
	x11vnc \
	xterm \
	xvfb

# Clone noVNC from github
RUN git clone -b v1.4.0 --depth 1 https://github.com/novnc/noVNC.git /root/noVNC \
	&& git clone -b v0.11.0 --depth 1 https://github.com/novnc/websockify.git /root/noVNC/utils/websockify \
	&& rm -rf /root/noVNC/.git \
	&& rm -rf /root/noVNC/utils/websockify/.git \
	&& apk del git

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]