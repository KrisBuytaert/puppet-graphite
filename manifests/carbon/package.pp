# Class: graphite::carbon::package
#
# This is a private class, do not use inside a manifest/role/profile
#
# Parameters:
#
# $carbon_package:
#   The name of the to-install carbon package.
#   Default: 'python-carbon'
#
# $carbon_package_ensure:
#   The state the package needs to be in.
#   Default: 'installed'
#
# Actions:
#
# Install the carbon package.
#
# Requires:
#
# graphite::carbon
# inherits params from graphite::carbon
#
# Sample Usage:
#
# contain graphite::carbon::package
#
# [Remember: No empty lines between comments and class definition]
class graphite::carbon::package inherits graphite::carbon{
  package { $graphite::carbon::carbon_package:
    ensure => $graphite::carbon::carbon_package_ensure,
    before => Service[$graphite::carbon::carbon_cache_service_name],
  }
}
