FROM ubuntu:trusty
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
COPY entrypoint.sh /entrypoint.sh
RUN apt-get update && apt-get -y dist-upgrade && \
	apt-get -y install git authbind python-pip python-dev libpq-dev && \
	useradd -d /home/shockpot -s /bin/bash -m -U shockpot && \
	cd /opt && \
	git clone https://github.com/threatstream/shockpot && \
	cd shockpot && \
	pip install -r requirements.txt && \
	mkdir -p log && \
	sed -i "s/logfile = os\\.path\\.join(os\\.path\\.abspath(os\\.path\\.dirname(__file__)), 'shockpot\\.log')/logfile = os\\.path\\.join(os\\.path\\.abspath(os\\.path\\.dirname(__file__)), 'log', 'shockpot\\.log')/" logger.py && \
	chown -R shockpot:shockpot /opt/shockpot && \
	touch /etc/authbind/byport/80 && \
	chown shockpot /etc/authbind/byport/80 && \
	chmod 500 /etc/authbind/byport/80 && \
	chmod +x /entrypoint.sh
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
