# Class: ::graphite::carbon::service
#
# This is a private class, do not use inside a manifest/role/profile
#
# Parameters:
#
# $graphite::carbon::carbon_cache_service_name:
#   The name of the carbon cache service.
#   Default: 'carbon_cache'
#
# $graphite::carbon::carbon_cache_service_ensure:
#   The state of the carbon-cache service to be in.


#
# Sample Usage:
#
# contain graphite::carbon::service
#
# [Remember: No empty lines between comments and class definition]
class graphite::carbon::service inherits graphite::carbon {

  service { $graphite::carbon::carbon_cache_service_name:
    ensure     => $graphite::carbon::carbon_cache_service_enable,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  service { $graphite::carbon::relay_service_name:
    ensure     => $graphite::carbon::carbon_cache_service_enable,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
