# Class: graphite::web::params
#
class graphite::web::params {
  $service_name = $::osfamily ? {
    /(?i:Debian)/ => 'apache2',
    /(?i:RedHat)/ => 'httpd',
    default       => 'httpd',
  }
}

