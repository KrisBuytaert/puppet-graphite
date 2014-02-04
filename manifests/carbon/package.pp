# Class: graphite::carbon::package
#
class graphite::carbon::package {
  $package_name = $::osfamily ? {
    /(?i:Debian)/ => 'python-carbon',
    /(?i:RedHat)/ => 'python-carbon',
    default       => 'carbon',
  }

  package { $package_name:
    ensure => present;
  }
}

