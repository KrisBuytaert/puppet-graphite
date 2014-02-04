# == Class: graphite
#
# This module manages graphite
#
# == Sample Usage:
#
#   include graphite
#
# == Todo:
#
# * Implement user creation.
#
class graphite (
  $vhost_serveralias = $graphite::params::vhost_serveralias,
  $vhost_servername  = $graphite::params::vhost_servername,
) inherits graphite::params {
  include graphite::carbon
  include graphite::whisper
  include graphite::web
  include graphite::config
}

