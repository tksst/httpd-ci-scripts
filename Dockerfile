FROM centos:6

RUN yum -y update \
	&& yum -y install bzip2 tar gcc make autoconf libtool file which pcre-devel zlib-devel openssl-devel openldap-devel libxml2-devel lua-devel perl-Crypt-SSLeay perl-URI perl-HTML-Parser perl-HTML-Tagset perl-ExtUtils-MakeMaker perl-libwww-perl perl-DateTime \
	&& yum clean all

RUN APR=apr-1.5.2 \
	&& curl http://archive.apache.org/dist/apr/${APR}.tar.bz2 | tar -xjf - \
	&& ( \
		cd ${APR} \
		&& ./configure --prefix=/usr/local \
		&& make -j3 \
		&& make install \
	) \
	&& rm -rf ${APR}

RUN APU=apr-util-1.5.4 \
	&& curl http://archive.apache.org/dist/apr/${APU}.tar.bz2 | tar -xjf - \
	&& ( \
		cd ${APU} \
		&& ./configure --prefix=/usr/local --with-apr=/usr/local --with-ldap --with-crypto \
		&& make -j3 \
		&& make install \
	) \
	&& rm -rf ${APU}

RUN useradd testuser
