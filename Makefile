#
#    dnscvsutil - manage DNS zone files under CVS
#    Copyright (C) 1999 Tommi Virtanen <tv@havoc.fi>
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

PREFIX=/usr
MANDIR=$(DESTDIR)$(PREFIX)/share/man/man1
BINDIR=$(DESTDIR)$(PREFIX)/bin
CONFDIR=$(DESTDIR)/etc

MAN=dns-update.1 mkrdns.1
BIN=dns-update mkrdns
CONF=dns-update.conf

all: doc

doc: $(MAN) 

%.1: %
	pod2man $< >$@.tmp
	mv $@.tmp $@

install: all
	test -d $(MANDIR) || install -d -m0755 $(MANDIR)
	test -d $(BINDIR) || install -d -m0755 $(BINDIR)
	install -m0644 $(MAN) $(MANDIR)
	install -m0755 $(BIN) $(SCRIPT) $(BINDIR)
	test -d $(CONFDIR) || install -d -m0755 $(CONFDIR)
	install -m0644 $(CONF) $(CONFDIR)

clean:
	-rm -f *.1
