# Class: graphite::carbon::service
#
class graphite::carbon::service {
  $service_name = $::osfamily ? {
    /(?i:Debian)/ => 'carbon-cache',
    /(?i:RedHat)/ => 'carbon-cache',
    default       => 'carbon-cache',
  }

  service { $service_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}

