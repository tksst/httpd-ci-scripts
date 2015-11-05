FROM centos:6

RUN yum -y update && yum -y install tar gcc make autoconf libtool file which pcre-devel zlib-devel openssl-devel openldap-devel libxml2-devel lua-devel perl-Crypt-SSLeay perl-URI perl-HTML-Parser perl-HTML-Tagset perl-ExtUtils-MakeMaker perl-libwww-perl perl-DateTime && yum clean all
RUN useradd testuser

