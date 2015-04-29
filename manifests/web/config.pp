# Class: graphite::web::config
#
# This is a private class, do not use inside a manifest/role/profile
#
# Parameters:
#
# $whisper_dir:
#   The directory where the whisper database is.
#   Default: '/var/lib/carbon/whisper'
#
# $web_dir:
#   The directory where the graphite-web config is put in.
#   Default: '/etc/graphite-web'
#
# Sample Uses:
#
# contain graphite::web::config
class graphite::web::config (
  $whisper_dir       = $graphite::params::whisper_dir,
  $database_name     = "${graphite::params::web_dir}graphite.db",
  $database_engine   = 'django.db.backends.sqlite3',
  $database_user     = '',
  $database_password = '',
  $database_host     = '',
  $database_port     = '',
  ) inherits graphite::web {

  file {'local_settings.py':
    ensure  => file,
    path    => "${::graphite::params::web_dir}local_settings.py",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['graphite-web'],
    content => template('graphite/local_settings.py.erb');
  }
}
