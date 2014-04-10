# Class: graphite::web::config
#
class graphite::web::config ($timezone='Europe/Brussels'){
  $config_dir   = $::graphite::web::config_dir
  $http_config_dir = $::graphite::web::params::http_config_dir
  $log_dir      = $::graphite::web::params::log_dir
  $service_name = $::graphite::web::params::service_name
  $django_root_dir = $::graphite::params::django_root_dir
  $graphite_root = $::graphite::web::params::graphite_root
  $extra_http_config = $::graphite::web::extra_http_config
  $whisper_dir = $::graphite::web::params::whisper_dir

  exec { 'graphite_syncdb':
    command     => 'python manage.py syncdb --noinput',
    path        => '/usr/bin',
    cwd         => $django_root_dir,
    refreshonly => true,
    subscribe   => [File['graphite_settings'], Package['graphite-web']],
  }

  file { 'graphite_settings':
    ensure    => file,
    path      => "${config_dir}/local_settings.py",
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service[$service_name],
    content   => template('graphite/local_settings.py.erb'),
    require   => Package['graphite-web'],
  }

  if $::osfamily == 'RedHat' {
    file { "${graphite_root}/storage":
      ensure  => directory,
      owner   => 'apache',
      group   => 'apache',
      notify  => Service[$service_name],
      require => Package[$::graphite::web::package::package_name],
    } ->
    file { "${graphite_root}/storage/whisper":
      ensure  => directory,
      owner   => 'carbon',
      group   => 'carbon',
      notify  => Service[$service_name],
      require => Package[$::graphite::web::package::package_name],
    }
  }
  if $::osfamily == 'Debian' {
    file { "${config_dir}/apache2.conf":
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      notify  => Service[$service_name],
      content => template("graphite/apache2.conf.${::osfamily}.erb");
    }
  }
  if $::osfamily == 'RedHat' {
    file { "${http_config_dir}/00-graphite.conf":
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      notify  => Service[$service_name],
      content => template("graphite/apache2.conf.${::osfamily}.erb");
    }
  }
}

