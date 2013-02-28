# Class: graphite::carbon::params
#
class graphite::carbon::params {
  $config_dir = $::osfamily ? {
    /(?i:Debian)/ => '/opt/graphite/conf',
    /(?i:RedHat)/ => '/etc/carbon',
    default       => '/etc/carbon',
  }

  $service_name = $::osfamily ? {
    /(?i:Debian)/ => 'carbon-cache',
    /(?i:RedHat)/ => 'carbon-cache',
    default       => 'carbon-cache',
  }

  $www_user = $::osfamily ? {
    /(?i:Debian)/ => 'www-data',
    /(?i:RedHat)/ => 'apache',
    default       => 'apache',
  }

  $www_group = $::osfamily ? {
    /(?i:Debian)/ => 'www-data',
    /(?i:RedHat)/ => 'apache',
    default       => 'apache',
  }
}

