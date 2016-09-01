FROM ubuntu:16.04
WORKDIR /usr/local/postgres-install

RUN apt-get update && apt-get -y upgrade && apt-get -y install build-essential libreadline6 libreadline6-dev zlib1g-dev

ADD https://ftp.postgresql.org/pub/source/v8.0.2/postgresql-8.0.2.tar.gz /usr/local/postgres-install/postgresql-8.0.2.tar.gz

RUN gunzip postgresql-8.0.2.tar.gz
RUN tar xf postgresql-8.0.2.tar

WORKDIR /usr/local/postgres-install/postgresql-8.0.2

RUN ./configure
RUN make
RUN make install
RUN adduser postgres
RUN mkdir /usr/local/pgsql/data
RUN chown postgres /usr/local/pgsql/data
RUN runuser -l postgres -c '/usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data'

CMD runuser -l postgres -c '/usr/local/pgsql/bin/postmaster -D /usr/local/pgsql/data'

