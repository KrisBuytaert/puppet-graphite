# == Class: graphite::config
#
class graphite::config {
  $config_dir = $::graphite::params::config_dir

  if $::osfamily == 'Debian' {
    exec { 'syncdb':
      command => 'python manage.py syncdb',
      path    => '/usr/bin',
      cwd     => $config_dir,
    }
  }
}

