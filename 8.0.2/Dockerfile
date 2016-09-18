FROM ubuntu:16.04
WORKDIR /usr/local/postgres-install

RUN apt-get update && apt-get -y upgrade && apt-get -y install build-essential libreadline6 libreadline6-dev zlib1g-dev vim

ADD https://ftp.postgresql.org/pub/source/v8.0.2/postgresql-8.0.2.tar.gz /usr/local/postgres-install/postgresql-8.0.2.tar.gz

RUN gunzip postgresql-8.0.2.tar.gz && tar xf postgresql-8.0.2.tar

WORKDIR /usr/local/postgres-install/postgresql-8.0.2

RUN ./configure && make && make install && adduser postgres && mkdir /usr/local/pgsql/data && chown postgres /usr/local/pgsql/data

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh && chown postgres /docker-entrypoint.sh

USER postgres
WORKDIR /usr/local/pgsql/bin

RUN ./initdb -D ./../data

COPY ./postgresql.conf /usr/local/pgsql/data
COPY ./pg_hba.conf /usr/local/pgsql/data


ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ./postmaster -D ./../data

