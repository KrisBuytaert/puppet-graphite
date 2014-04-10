# = Class: graphite::carbon
#
class graphite::carbon (
  $enable_udp_listener = $::graphite::params::enable_udp_listener,
){
  include graphite::carbon::params
  include graphite::carbon::package
  include graphite::carbon::config
  include graphite::carbon::service
}

