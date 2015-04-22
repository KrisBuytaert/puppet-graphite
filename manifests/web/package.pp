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
  Package {
    ensure => present,
  }

  $soft = ['bitmap-fonts-compat','graphite-web']

  package { $soft : }
}
