# Class: graphite
#
# This is a private class, do not use inside a manifest/role/profile
#
# Parameters:
#
# $web_package:
#   The name of the to-install package(s).
#   Default: 'bitmap-fonts-compat' and 'graphite-web'
#
# $web_package_ensure:
#   The state the package(s) should be in.
#   Default: 'installed'
#
# Actions:
#
# Installes the required package(s)
#
# Requires:
#
# graphite::web
# inherits params from graphite::web
#
# Sample Usage:
#
# contain graphite::web::package
#
# [Remember: No empty lines between comments and class definition]
class graphite::web::package () inherits graphite::web {
  $soft = ['bitmap-fonts-compat','graphite-web']
  package { $web_package:
    ensure => $web_package_ensure,
    before => Service[$web_service_name],
  }
}
