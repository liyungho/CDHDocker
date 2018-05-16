FROM centos:centos7

RUN echo "proxy=http://proxy.cht.com.tw:8080" >> /etc/yum.conf \
&& yum -y update \
&& yum -y install sudo psmisc wget initscripts openssh-server openssh-clients \
&& echo -e "use_proxy=yes\nhttp_proxy=proxy.cht.com.tw:8080\nhttps_proxy=proxy.cht.com.tw:8080\n" >> ~/.wgetrc \
&& wget https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/cloudera-manager.repo -O /etc/yum.repos.d/cloudera-manager.repo \
&& yum -y install oracle-j2sdk1.7 \
&& yum -y install cloudera-manager-daemons cloudera-manager-server \
&& sshd-keygen

RUN yum -y install postgresql-server postgresql postgresql-contrib \
&& sed -i '/PGDATA=/,/tail -n 1/{/sed/d;}' /usr/bin/postgresql-setup \
&& sed -i 's/^PGDATA=.*/PGDATA=\/var\/lib\/pgsql\/data/g' /usr/bin/postgresql-setup \
&& sed -i '/PGPORT=/,/tail -n 1/{/sed/d;}' /usr/bin/postgresql-setup \
&& sed -i 's/^PGPORT=.*/PGPORT=5432/g' /usr/bin/postgresql-setup \
&& /usr/bin/postgresql-setup initdb \
&& echo "host    all             all             172.17.0.2/32           md5" >> /var/lib/pgsql/data/pg_hba.conf \
&& sed -i 's/^host.*all.*all.*127\.0\.0\.1\/32.*ident/host\tall\t\tall\t\t127\.0\.0\.1\/32\t\tmd5\n&/' /var/lib/pgsql/data/pg_hba.conf \
&& echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf

COPY ./setup_scm_postgres.sh /tmp

