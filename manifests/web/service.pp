# Class: graphite::web::service
#
class graphite::web::service {
  service { 'httpd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}

