Name:           hostname
Version:        3.12
Release:        0
License:        GPL-2.0+
Summary:        Utility to set/show the host name or domain name
Url:            http://packages.qa.debian.org/h/hostname.html
Group:          System/Base
Source0:        http://ftp.de.debian.org/debian/pool/main/h/hostname/hostname_%{version}.tar.gz
Source1001: 	hostname.manifest

%description
This package provides commands which can be used to display the system's
DNS name, and to display or set its hostname or NIS domain name.

%prep
%setup -q -n hostname
cp %{SOURCE1001} .

%build
export CFLAGS+=" -fvisibility=hidden"
  export CXXFLAGS+=" -fvisibility=hidden"
  
make CFLAGS="%{optflags} $CFLAGS"

%install
make BASEDIR=%{buildroot} install
# english is enough
rm -rf %{buildroot}/usr/share/man/fr

%files 
%manifest %{name}.manifest
%license COPYRIGHT
/bin/*
%{_mandir}/man1/*

