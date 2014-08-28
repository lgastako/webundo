FROM ubuntu

RUN apt-get update -y -q

RUN apt-get install -y -q build-essential

RUN apt-get install -y -q locate
RUN apt-get install -y -q wget
RUN apt-get install -y -q curl
RUN apt-get install -y -q git
RUN apt-get install -y -q ack-grep
RUN apt-get install -y -q expect-dev

RUN apt-get install -y -q libxml2-dev
RUN apt-get install -y -q libxslt-dev
RUN apt-get install -y -q libncurses-dev

# pre-reqs for postgres
RUN apt-get install -y -q libproj-dev
RUN apt-get install -y -q libjson0-dev
RUN apt-get install -y -q xsltproc
RUN apt-get install -y -q docbook-xsl
RUN apt-get install -y -q docbook-mathml
RUN apt-get install -y -q libgdal1-dev

# postgresql-9.3
RUN apt-get install -y -q postgresql-9.3
RUN apt-get install -y -q postgresql-client-9.3
RUN apt-get install -y -q postgresql-contrib-9.3

# postgis 2.0 for postgres 9.3 (and pgadmin3, why not)
RUN apt-get -y install -q Postgresql-9.3-postgis
RUN apt-get install -y -q pgadmin3
RUN apt-get install -y -q postgresql-contrib

RUN apt-get install -y -q python-setuptools
RUN easy_install pip

RUN apt-get install -y -q python-yaml
RUN apt-get install -y -q python-tz
RUN apt-get install -y -q python-requests
RUN apt-get install -y -q python-softare-properties
RUN apt-get install -y -q python-dev

RUN apt-get install -y -q openjdk-7-jre-headless
RUN apt-get install -y -q haskell-platform
RUN apt-get install -y -q php5
RUN apt-get install -y -q erlang
RUN apt-get install -y -q erlang-doc
RUN apt-get install -y -q nodejs npm
RUN apt-get install -y -q racket

ADD scala/scala-2.11.2.deb /scala-2.11.2.deb
RUN dpkg -i /scala-2.11.2.deb

RUN pip install --upgrade httpie

ADD clojure/lein /usr/local/bin/lein
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

RUN npm install coffee-script

ADD drake/drake /usr/local/bin/drake
