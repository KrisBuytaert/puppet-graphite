# Class graphite::carbon::whisper
#
# This is a private class, do not use inside a manifest/role/profile
#
# Parameters:
#
# $graphite::carbon::whisper_package:
#   The name of the to-install whisper package.
#   Default: 'python-whisper'
#
# $graphite::carbon::whipser_package_ensure:
#   The state of the package.
#   Default: 'installed'
#
# Actions:
#
# Install the whipser package.
#
# Requires:
#
# graphite::carbon
# inherits params from graphite::carbon
#
# Sample Usage:
#
# contain graphite::carbon::whisper
#
# [Remember: No empty lines between comments and cladd definition]
class graphite::carbon::whisper (
) inherits graphite::carbon {
  package { $graphite::carbon::whisper_package :
    ensure => $graphite::carbon::whisper_package_ensure,
  }
}
