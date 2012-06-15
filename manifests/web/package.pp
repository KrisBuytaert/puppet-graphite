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
class graphite::web::package {
  package {
    'bitmap-fonts-compat':
      ensure => present;
    'graphite-web':
      ensure => present;
  }
}
