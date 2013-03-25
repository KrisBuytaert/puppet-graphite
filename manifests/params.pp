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
class graphite::params (
  $graphite_root       = undef,
  $conf_dir            = undef,
  $storage_dir         = undef,
  $content_dir         = undef,
  $dashboard_conf      = undef,
  $graphtemplates_conf = undef,
  $whisper_dir         = undef,
  $log_dir             = undef,
  $index_file          = undef,
  $time_zone           = undef,
  $use_ldap_auth       = false,
  $ldap_server         = undef,
  $ldap_port           = 389,
  $ldap_search_base    = undef,
  $ldap_base_user      = undef,
  $ldap_base_pass      = undef,
  $ldap_user_query     = undef,
  $memcache_hosts      = undef) {
}

