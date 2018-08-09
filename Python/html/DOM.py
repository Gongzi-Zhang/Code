#!/usr/bin/python

# Python DOM example: how to parse DOM using python library
import xml.dom.minidom as m
doc = m.parse("/path/to/file.xml");
doc.nodeName	# DOM property of document object
p_list = doc.getElementsByTagName("para");
