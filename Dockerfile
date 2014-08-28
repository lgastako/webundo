FROM ubuntu

RUN apt-get update -y -q

RUN apt-get install -y -q python-setuptools
RUN easy_install pip

RUN apt-get install -y -q python-yaml
RUN apt-get install -y -q python-tz
RUN apt-get install -y -q python-requests
RUN apt-get install -y -q build-essential
RUN apt-get install -y -q python-dev
RUN apt-get install -y -q expect-dev
RUN apt-get install -y -q locate
RUN apt-get install -y -q openjdk-7-jre-headless
RUN apt-get install -y -q wget
RUN apt-get install -y -q curl
RUN apt-get install -y -q git
RUN apt-get install -y -q ack-grep
RUN apt-get install -y -q libxml2-dev
RUN apt-get install -y -q libxslt-dev
RUN apt-get install -y -q libncurses-dev
RUN apt-get install -y -q php5

RUN pip install --upgrade httpie

ADD lein /usr/local/bin/lein
RUN chmod 755 /usr/local/bin/lein
RUN lein

RUN pip install ipdb \
                PyYAML \
                beautifulsoup4 \
                numpy \
                python-dateutil \
                pytz \
                quantities \
                semantic \
                six \
                requests \
                lxml
RUN easy_install readline

ADD drake /usr/local/bin/drake
