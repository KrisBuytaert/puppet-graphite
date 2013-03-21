# = Class: graphite
#
# This module manages graphite
#
# == Sample Usage:
#
#   include graphite
#
# == Todo:
#
# * Implement user creation.
#
class graphite ($ldap_url, $ldap_pw, $ldap_group) {
  include graphite::params
  include graphite::carbon
  include graphite::whisper
  include graphite::web
  include graphite::config
}

