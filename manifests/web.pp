# = Class: graphite::web
#
# Installs the graphite webfontend.
#
# == Actions:
#
# Installs packages for graphite web frontend.
#
# == Requires:
#
# Running web server.
#
# == Todo:
#
# * Update documentation
#
class graphite::web (
  $time_zone                = $::graphite::params::time_zone,
  $manage_httpd             = $::graphite::params::manage_httpd
  $basic_http_auth          = $::graphite::params::basic_http_auth
  $basic_http_auth_password = $::graphite::params::basic_http_auth_password
  ) {
  require graphite::params
  include graphite::web::package
  class {'graphite::web::config':
    time_zone => $time_zone,
  }
  if $manage_httpd {
    include graphite::web::service
  }
  if $basic_http_auth {
    include graphite::web::auth
  }
}



