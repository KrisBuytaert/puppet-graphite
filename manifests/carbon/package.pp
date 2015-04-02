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
  package { $carbon_package:
    ensure => $carbon_package_ensure,
    before => Service['carbon-cache'];
  }
}
