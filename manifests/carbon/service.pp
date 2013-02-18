# Class: graphite::carbon::service
#
class graphite::carbon::service {
  $service_name = $::graphite::carbon::params::service_name

  service { $service_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}

