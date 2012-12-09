Name:           hostname
Version:        3.12
Release:        0
License:        GPL-2.0+
Summary:        Utility to set/show the host name or domain name
Url:            http://packages.qa.debian.org/h/hostname.html
Group:          System/Base
Source0:        http://ftp.de.debian.org/debian/pool/main/h/hostname/hostname_%{version}.tar.gz

%description
This package provides commands which can be used to display the system's
DNS name, and to display or set its hostname or NIS domain name.

%prep
%setup -q -n hostname

%build
iconv -f iso-8859-1 -t utf-8 -o hostname.tmp hostname.1.fr && mv hostname.tmp hostname.1.fr
make CFLAGS="%{optflags} $CFLAGS"

%install
make BASEDIR=%{buildroot} install

%find_lang %{name} --all-name --with-man

%files -f %{name}.lang
%license COPYRIGHT
/bin/*
%{_mandir}/man1/*

