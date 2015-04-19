# Class: ::graphite::carbon::service
#
# This is a private class, do not use inside a manifest/role/profile
#
# Parameters:
#
# $carbon_cache_service_name:
#   The name of the carbon cache service.
#   Default: 'carbon_cache'
#
# $carbon_cache_service_ensure:
#   The state of the carbon-cache service to be in.
#   Default: 'running'
#
# Sample Usage:
#
# contain graphite::carbon::service
#
# [Remember: No empty lines between comments and class definition]
class graphite::carbon::service inherits graphite::carbon {

  service { $carbon_cache_service_name:
    ensure     => $carbon_cache_service_ensure,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}
