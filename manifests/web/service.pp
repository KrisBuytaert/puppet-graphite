# Class: graphite::web::service
#
class graphite::web::service {
  $service_name = $graphite::web::params::service_name

  service { $service_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}

