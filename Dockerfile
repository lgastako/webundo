FROM ubuntu

# Should be no longer necessary...
# # Postgresql 9.3
# ADD postgresql/ACCC4CF8.asc /ACCC4CF8.asc
# RUN apt-key add /ACCC4CF8.asc
# RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" >> /etc/apt/sources.list

ADD charles/PublicKey /charles.PublicKey
RUN cat /charles.PublicKey | sudo apt-key add -

RUN echo "deb http://cran.cnr.berkeley.edu/bin/linux/ubuntu precise/" >> /etc/apt/sources.list
RUN echo "deb http://www.charlesproxy.com/packages/apt/ charles-proxy main" >> /etc/apt/sources.list

RUN apt-get update -y -q

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales
RUN update-locale LANG=en_US.UTF-8

RUN apt-get install -y -q build-essential

RUN apt-get install -y -q locate
RUN apt-get install -y -q strace
RUN apt-get install -y -q valgrind
RUN apt-get install -y -q git
RUN apt-get install -y -q wget
RUN apt-get install -y -q curl
RUN apt-get install -y -q netcat
RUN apt-get install -y -q lynx
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

# postgis 2.0 for postgres 9.3
RUN apt-get install -y -q postgresql-9.3-postgis-2.1
RUN apt-get install -y -q postgresql-9.3-postgis-scripts

# (and pgadmin3, why not)
RUN apt-get install -y -q pgadmin3
RUN apt-get install -y -q postgresql-contrib

ADD postgresql/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ADD postgresql/postgresql.conf /etc/postgresql/9.3/main/postgresql.conf

RUN apt-get install -y -q python-setuptools
RUN easy_install pip

RUN pip install --upgrade httpie

RUN apt-get install -y -q python-yaml
RUN apt-get install -y -q python-tz
RUN apt-get install -y -q python-requests
RUN apt-get install -y -q python-software-properties
RUN apt-get install -y -q python-dev

RUN apt-get install -y -q python-numpy
RUN apt-get install -y -q python-scipy
RUN apt-get install -y -q python-matplotlib
RUN apt-get install -y -q ipython
RUN apt-get install -y -q ipython-notebook
RUN apt-get install -y -q python-pandas
RUN apt-get install -y -q python-sympy
RUN apt-get install -y -q python-nose

RUN apt-get install -y -q openjdk-7-jre-headless
RUN apt-get install -y -q haskell-platform
RUN apt-get install -y -q php5
RUN apt-get install -y -q erlang
RUN apt-get install -y -q erlang-doc
RUN apt-get install -y -q nodejs npm
RUN apt-get install -y -q racket
RUN apt-get install -y -q g77
RUN apt-get install -y -q gfortran
RUN apt-get install -y -q lua5.2
RUN apt-get install -y -q r-base
RUN apt-get install -y -q r-base-dev
RUN apt-get install -y -q charles-proxy

ADD scala/scala-2.11.2.deb /scala-2.11.2.deb
RUN dpkg -i /scala-2.11.2.deb

ADD ocaml/opam_installer.sh /opam_installer.sh
RUN chmod 755 /opam_installer.sh
RUN sh /opam_installer.sh /usr/local/bin

ADD go/go1.3.linux-amd64.tar.gz /go1.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf /go1.3.linux-amd64.tar.gz
RUN echo 'export PATH=/usr/local/go/bin:$PATH' > /etc/profile.d/golang.sh

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

RUN npm install -g coffee-script
RUN npm install -g yo
RUN npm install -g gulp
RUN npm install -g bower
#RUN npm install gulp-jshint gulp-sass gulp-concat gulp-uglify gulp-rename --save-dev

ADD drake/drake /usr/local/bin/drake

# TODO: Selenium

