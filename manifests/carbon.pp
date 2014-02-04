# == Class: graphite::carbon
#
class graphite::carbon {
  include graphite::carbon::params
  include graphite::carbon::package
  include graphite::carbon::config
  include graphite::carbon::service
}

