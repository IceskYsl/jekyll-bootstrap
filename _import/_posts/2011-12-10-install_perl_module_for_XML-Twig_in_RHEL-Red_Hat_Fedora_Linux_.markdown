---
layout: post
title: install_perl_module_for_XML-Twig_in_RHEL-Red_Hat_Fedora_Linux_
date: '2011-12-10'
comments: true
categories: Mac&*UNIX
tags: perl Twig xml
link: true
---
This module provides a way to process XML documents. It is build on top of XML::Parser. XML::Twig offers a tree interface to the document, while allowing you to output the parts of it that have been completely processed. It allows minimal resource (CPU and memory) usage by building the tree only for the parts of the documents that need actual processing, through the use of the twig_roots and twig_print_outside_roots options.(as pointed by yum info)

Let’s first search for the package
$ yum search perl-XML-Twig
perl-XML-Twig.noarch : A perl module for processing huge XML documents in tree

Note that you must be the root/administrator to install the package. To install this package in Red Hat/Fedora Linux.
$ yum install perl-XML-Twig.noarch

You can check the details of this package perl-XML-Twig
$ yum info perl-XML-Twig.noarch

或者：
perl -MCPAN -e 'install XML::Twig'
