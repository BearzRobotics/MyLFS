install -vdm755 /usr/share/xml/docbook/schema/{dtd,rng,sch,xsd}/5.0 &&
install -vm644  dtd/* /usr/share/xml/docbook/schema/dtd/5.0         &&
install -vm644  rng/* /usr/share/xml/docbook/schema/rng/5.0         &&
install -vm644  sch/* /usr/share/xml/docbook/schema/sch/5.0         &&
install -vm644  xsd/* /usr/share/xml/docbook/schema/xsd/5.0

xmlcatalog --noout --create /usr/share/xml/docbook/schema/dtd/5.0/catalog.xml &&

xmlcatalog --noout --add "public" \
  "-//OASIS//DTD DocBook XML 5.0//EN" \
  "docbook.dtd" /usr/share/xml/docbook/schema/dtd/5.0/catalog.xml &&
xmlcatalog --noout --add "system" \
  "http://www.oasis-open.org/docbook/xml/5.0/dtd/docbook.dtd" \
  "docbook.dtd" /usr/share/xml/docbook/schema/dtd/5.0/catalog.xml &&

xmlcatalog --noout --create /usr/share/xml/docbook/schema/rng/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://docbook.org/xml/5.0/rng/docbook.rng" \
  "docbook.rng" /usr/share/xml/docbook/schema/rng/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://www.oasis-open.org/docbook/xml/5.0/rng/docbook.rng" \
  "docbook.rng" /usr/share/xml/docbook/schema/rng/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://docbook.org/xml/5.0/rng/docbookxi.rng" \
  "docbookxi.rng" /usr/share/xml/docbook/schema/rng/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://www.oasis-open.org/docbook/xml/5.0/rng/docbookxi.rng" \
  "docbookxi.rng" /usr/share/xml/docbook/schema/rng/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://docbook.org/xml/5.0/rng/docbook.rnc" \
  "docbook.rnc" /usr/share/xml/docbook/schema/rng/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://www.oasis-open.org/docbook/xml/5.0/rng/docbook.rnc" \
  "docbook.rnc" /usr/share/xml/docbook/schema/rng/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://docbook.org/xml/5.0/rng/docbookxi.rnc" \
  "docbookxi.rnc" /usr/share/xml/docbook/schema/rng/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://www.oasis-open.org/docbook/xml/5.0/rng/docbookxi.rnc" \
  "docbookxi.rnc" /usr/share/xml/docbook/schema/rng/5.0/catalog.xml &&

xmlcatalog --noout --create /usr/share/xml/docbook/schema/sch/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://docbook.org/xml/5.0/sch/docbook.sch" \
  "docbook.sch" /usr/share/xml/docbook/schema/sch/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://www.oasis-open.org/docbook/xml/5.0/sch/docbook.sch" \
  "docbook.sch" /usr/share/xml/docbook/schema/sch/5.0/catalog.xml &&

xmlcatalog --noout --create /usr/share/xml/docbook/schema/xsd/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://docbook.org/xml/5.0/xsd/docbook.xsd" \
  "docbook.xsd" /usr/share/xml/docbook/schema/xsd/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://www.oasis-open.org/docbook/xml/5.0/xsd/docbook.xsd" \
  "docbook.xsd" /usr/share/xml/docbook/schema/xsd/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://docbook.org/xml/5.0/xsd/docbookxi.xsd" \
  "docbookxi.xsd" /usr/share/xml/docbook/schema/xsd/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://www.oasis-open.org/docbook/xml/5.0/xsd/docbookxi.xsd" \
  "docbookxi.xsd" /usr/share/xml/docbook/schema/xsd/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
  "http://docbook.org/xml/5.0/xsd/xlink.xsd" \
  "xlink.xsd" /usr/share/xml/docbook/schema/xsd/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
   "http://www.oasis-open.org/docbook/xml/5.0/xsd/xlink.xsd" \
   "xlink.xsd" /usr/share/xml/docbook/schema/xsd/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
   "http://docbook.org/xml/5.0/xsd/xml.xsd" \
   "xml.xsd" /usr/share/xml/docbook/schema/xsd/5.0/catalog.xml &&
xmlcatalog --noout --add "uri" \
   "http://www.oasis-open.org/docbook/xml/5.0/xsd/xml.xsd" \
   "xml.xsd" /usr/share/xml/docbook/schema/xsd/5.0/catalog.xml

if [ ! -e /etc/xml/catalog ]; then
    install -v -d -m755 /etc/xml &&
    xmlcatalog --noout --create /etc/xml/catalog
fi &&
xmlcatalog --noout --add "delegatePublic" \
  "-//OASIS//DTD DocBook XML 5.0//EN" \
  "file:///usr/share/xml/docbook/schema/dtd/5.0/catalog.xml" \
  /etc/xml/catalog &&
xmlcatalog --noout --add "delegateSystem" \
  "http://docbook.org/xml/5.0/dtd/" \
  "file:///usr/share/xml/docbook/schema/dtd/5.0/catalog.xml" \
  /etc/xml/catalog &&
xmlcatalog --noout --add "delegateURI" \
  "http://docbook.org/xml/5.0/dtd/" \
  "file:///usr/share/xml/docbook/schema/dtd/5.0/catalog.xml" \
  /etc/xml/catalog &&
xmlcatalog --noout --add "delegateURI" \
  "http://docbook.org/xml/5.0/rng/"  \
  "file:///usr/share/xml/docbook/schema/rng/5.0/catalog.xml" \
  /etc/xml/catalog &&
xmlcatalog --noout --add "delegateURI" \
  "http://docbook.org/xml/5.0/sch/"  \
  "file:///usr/share/xml/docbook/schema/sch/5.0/catalog.xml" \
  /etc/xml/catalog &&
xmlcatalog --noout --add "delegateURI" \
  "http://docbook.org/xml/5.0/xsd/"  \
  "file:///usr/share/xml/docbook/schema/xsd/5.0/catalog.xml" \
  /etc/xml/catalog

  