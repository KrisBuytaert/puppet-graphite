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
  $time_zone         = undef,
  $whisper_dir       = ${::graphite::params::whisper_dir},
  $database_name     = "${::graphite::params::graphite_web_dir}graphite.db",
  $database_engine   = 'django.db.backends.sqlite3',
  $database_user     = '',
  $database_password = '',
  $database_host     = '',
  $database_port     = '',
  ){

  file {'local_settings.py':
    ensure  => file,
    path    => "${::graphite::params::graphite_web_dir}local_settings.py",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['graphite-web'],
    content => template('graphite/local_settings.py.erb');
  }
}
