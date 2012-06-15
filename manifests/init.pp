# = Class: graphite
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
class graphite ($time_zone = undef) {

  include graphite::carbon
  include graphite::whisper
  class {'graphite::web':
    time_zone => $time_zone,
  }

}

