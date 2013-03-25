# = Class: graphite::web
#
# Installs the graphite webfontend.
#
# == Actions:
#
# Installs packages for graphite web frontend.
#
# == Requires:
#
# Running web server.
#
# == Todo:
#
# * Update documentation
#
class graphite::web (
  $graphite_root       = $::graphite::params::graphite_root,
  $conf_dir            = $::graphite::params::conf_dir,
  $storage_dir         = $::graphite::params::storage_dir,
  $content_dir         = $::graphite::params::content_dir,
  $dashboard_conf      = $::graphite::params::dashboard_conf,
  $graphtemplates_conf = $::graphite::params::graphtemplates_conf,
  $whisper_dir         = $::graphite::params::whisper_dir,
  $log_dir             = $::graphite::params::log_dir,
  $index_file          = $::graphite::params::index_file,
  $time_zone           = $::graphite::params::time_zone,
  $use_ldap_auth       = $::graphite::params::use_ldap_auth,
  $ldap_server         = $::graphite::params::ldap_server,
  $ldap_port           = $::graphite::params::ldap_port,
  $ldap_search_base    = $::graphite::params::ldap_search_base,
  $ldap_base_user      = $::graphite::params::ldap_base_user,
  $ldap_base_pass      = $::graphite::params::ldap_base_pass,
  $ldap_user_query     = $::graphite::params::ldap_user_query,
  $memcache_hosts      = $::graphite::params::memcache_hosts) inherits ::graphite::params {

  include graphite::web::package

  class { 'graphite::web::config':
    graphite_root       => $graphite_root,
    conf_dir            => $conf_dir,
    storage_dir         => $storage_dir,
    content_dir         => $content_dir,
    dashboard_conf      => $dashboard_conf,
    graphtemplates_conf => $graphtemplates_conf,
    whisper_dir         => $whisper_dir,
    log_dir             => $log_dir,
    index_file          => $index_file,
    time_zone           => $time_zone,
    use_ldap_auth       => $use_ldap_auth,
    ldap_server         => $ldap_server,
    ldap_port           => $ldap_port,
    ldap_search_base    => $ldap_search_base,
    ldap_base_user      => $ldap_base_user,
    ldap_base_pass      => $ldap_base_pass,
    ldap_user_query     => $ldap_user_query,
    memcache_hosts      => $memcache_hosts
  }

  include graphite::web::service
}

