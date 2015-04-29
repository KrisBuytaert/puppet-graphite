# Class: graphite::relay::service
#
# This is a private class, do not use inside a manifest/role/profile
#
# Parameters:
#
# $relay_service_name:
#   The name of the relay service.
#   Default: 'carbon-relay'
#
# $relay_service_enable:
#   The state of the relay service.
#   Default: 'running'
#
# Actions:
#
# Set the relay service to the desired state.
#
# Requires:
#
# graphite::relay::package
# graphite::relay::config
# inherits params from graphite::relay
#
# Sample Usage:
#
# contain graphite::relay::service
#
# [Remember: No empty lines between comments and class definition]
class graphite::relay::service inherits graphite::relay {
  service { $relay_service_name:
    ensure     => $relay_service_enable,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
