CFLAGS+=-O2 -Wall

# uncomment the following line if you want to install to a different base dir.
#BASEDIR=/mnt/test

BINDIR:=/bin

OBJS=hostname.o

hostname: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS) -lnsl

install: hostname
	install -d ${BASEDIR}/usr/share/man/man1
	install -m 0644 hostname.1 ${BASEDIR}/usr/share/man/man1

	ln -fs hostname.1 ${BASEDIR}/usr/share/man/man1/dnsdomainname.1
	ln -fs hostname.1 ${BASEDIR}/usr/share/man/man1/domainname.1
	ln -fs hostname.1 ${BASEDIR}/usr/share/man/man1/ypdomainname.1
	ln -fs hostname.1 ${BASEDIR}/usr/share/man/man1/nisdomainname.1
	#install -o root -g root -m 0644 hostname.1.fr ${BASEDIR}/usr/share/man/fr/man1/hostname.1
	install -d ${BASEDIR}/usr/share/man/fr/man1
	install -m 0644 hostname.1.fr ${BASEDIR}/usr/share/man/fr/man1/hostname.1
	ln -fs hostname.1 ${BASEDIR}/usr/share/man/fr/man1/dnsdomainname.1
	ln -fs hostname.1 ${BASEDIR}/usr/share/man/fr/man1/domainname.1
	ln -fs hostname.1 ${BASEDIR}/usr/share/man/fr/man1/ypdomainname.1
	ln -fs hostname.1 ${BASEDIR}/usr/share/man/fr/man1/nisdomainname.1

	install -d ${BASEDIR}$(BINDIR)
	install -m 0755 hostname ${BASEDIR}$(BINDIR)
	ln -fs hostname ${BASEDIR}$(BINDIR)/dnsdomainname
	ln -fs hostname ${BASEDIR}$(BINDIR)/domainname
	ln -fs hostname ${BASEDIR}$(BINDIR)/nisdomainname
	ln -fs hostname ${BASEDIR}$(BINDIR)/ypdomainname

clean:
	-rm -f $(OBJS) hostname dnsdomainname domainname nisdomainname ypdomainname

.PHONY: clean install
