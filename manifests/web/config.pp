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
class graphite::web::config (
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

  exec { 'graphite_syncdb':
    path        => ['/bin', '/usr/bin'],
    command => "bash -c 'cd \$(python -c \"from distutils.sysconfig import get_python_lib; print(get_python_lib())\")/graphite && python ./manage.py syncdb'",
    refreshonly => true,
    subscribe   => File['local_settings.py'],
  }

  file { 'local_settings.py':
    ensure  => file,
    path    => '/etc/graphite-web/local_settings.py',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['httpd'],
    content => template('graphite/local_settings.py.erb');
  }

}
