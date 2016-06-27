Puppet module for Graphite
==========================

This is a puppet-graphite module.
All bugs produced by Kris.Buytaert@gmail.com

Dependencies
------------
This module depends on

- [concat](http://forge.puppetlabs.com/puppetlabs/concat)

Installation
------------

This module can be installed via the puppet module tool:

    puppet module install KrisBuytaert/graphite

Notes
-----

For EL6, Graphite, Carbon and Whisper are included in EPEL repository.
You can use a module such as http://forge.puppetlabs.com/stahnma/epel to
enable it on your machine.

Usage
-----

    include graphite

    graphite::carbon::storage {"default_1min_for_1day":
      pattern    => ".*",
      retentions => "60s:1d",
    }

Note that without this define you won't have the default behaviour.

Testing
-------

More Detailed Examples on how to use this module including a fully functional Vagrant box can be found on https://github.com/KrisBuytaert/vagrant-graphite.git


I've tagged the code that supports 0.9.9 versions of graphite-web and carbon with
the 0.9.9 tag ..

To Do
-----

Move params with pathos to case $::os['family']
Documentation
Move os params in graphite::web::service to params
