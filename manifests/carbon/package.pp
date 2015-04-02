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
# [Remember: No empty lines between comments and class definition]
class graphite::carbon::package inherits graphite::carbon{
  package { $package_carbon:
    ensure => $package_carbon_ensure,
    before => Service['carbon-cache'];
  }
}
