# Class: graphite::carbon::package
#
class graphite::carbon::package {
  package { 'carbon':
    ensure => present;
  }
}

