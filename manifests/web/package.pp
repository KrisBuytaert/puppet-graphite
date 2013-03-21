# Class: graphite::web::package
#
class graphite::web::package {
  $package_name = $::osfamily ? {
    /(?i:Debian)/ => [
      'python-django-tagging',
      'python-graphite-web',
    ],
    /(?i:RedHat)/ => 'graphite-web',
    default       => 'graphite-web',
  }

  if $::osfamily == 'RedHat' {
    package { 'bitmap-fonts-compat':
      ensure => present,
      before => Package[$package_name];
    }
    package { 'mod_python':
      ensure => present,
      before => Package[$package_name];
    }
  }

  package { $package_name:
    ensure => present;
  }
}

