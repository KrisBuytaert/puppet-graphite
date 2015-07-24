# Class: graphite::web::config
#
# This is a private class, do not use inside a manifest/role/profile
#
# Parameters:
#
# $whisper_dir:
#   The directory where the whisper database is.
#   Default: '/var/lib/carbon/whisper/'
#
# $web_dir:
#   The directory where the graphite-web config is put in.
#   Default: '/etc/graphite-web/'
#
# Sample Uses:
#
# contain graphite::web::config
class graphite::web::config (
  $whisper_dir       = $graphite::web::whisper_dir,
  $database_name     = "${graphite::web::web_dir}graphite.db",
  $database_engine   = 'django.db.backends.sqlite3',
  $database_user     = '',
  $database_password = '',
  $database_host     = '',
  $database_port     = '',
  ) inherits graphite::web {

  file { 'local_settings.py':
    ensure  => file,
    path    => "${graphite::web::web_dir}local_settings.py",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package[$graphite::web::web_package],
    content => template('graphite/web/local_settings.py.erb');
  }

  file { 'index':
    ensure  => file,
    path    => $graphite::web::web_index_file,
    owner   => $graphite::web::web_user,
    group   => $graphite::web::web_group,
    mode    => '0644',
    require => Package[$graphite::web::web_package],
  }

  file { 'graphite.db':
    ensure  => present,
    path    => $graphite::web::web_database_file,
    owner   => $graphite::web::web_user,
    group   => $graphite::web::web_group,
    mode    => '0644',
    require => Package[$graphite::web::web_package],
    before  => Service[$graphite::web::web_service_name],
  }

  # The upstream package disables access to the webgui on EL7 fixing.

  if $::operatingsystemmajrelease {
    $os_maj_release = $::operatingsystemmajrelease
  } else {
    $os_versions    = split($::operatingsystemrelease, '[.]')
    $os_maj_release = $os_versions[0]
  }
  if  $os_maj_release  == '7' {
    file {'/etc/httpd/conf.d/graphite-web.conf':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      notify  => Service[$graphite::web::web_service_name],
      content => template('graphite/web/graphite-web.conf.7.erb');
    }

  }

}
