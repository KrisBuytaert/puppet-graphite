# Class: graphite::relay::package
#
# This is a private class, do not use inside a manifest/role/profile
#
# Parameters:
#
# $carbon_package:
#   The name of the carbon package.
#   Default: 'python-carbon'
#
# $carbon_package_ensure,
#   The state of the carbon package.
#   Default: 'installed'
#
# Actions:
#
# Set the carbon package to the desired state.
#
# Requires:
#
# graphite::relay
# inherist params from graphite::relay
#
# Sample Usage:
#
# contain graphite::relay::package
#
# [Remember: No empty lines between comments and class definition]
class graphite::relay::package inherits graphite::relay {
  package { $graphite::relay::carbon_package:
    ensure => $graphite::relay::carbon_package_ensure,
    before => Service[$graphite::relay::relay_service_name],
  }
}
