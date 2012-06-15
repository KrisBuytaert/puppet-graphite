# Class: graphite
#
# This module manages graphite
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class graphite::web ($time_zone = undef) {

  include graphite::web::package
  class {'graphite::web::config':
    time_zone => $time_zone,
  }
  include graphite::web::service
}

