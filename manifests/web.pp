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
  $time_zone                = $::graphite::params::web_time_zone,
  $whisper_dir              = $::graphite::params::whisper_dir,
  $manage_httpd             = $::graphite::params::web_manage_httpd,
  $basic_http_auth          = $::graphite::params::web_basic_http_auth,
  $basic_http_auth_password = $::graphite::params::web_basic_http_auth_password,
  $cluster_servers          = undef,
  $graphite_web_port        = $::graphite::params::web_port,
  ) inherits ::graphite::params {
  contain graphite::web::package
  contain graphite::web::config

  if str2bool("$manage_httpd") {
    include graphite::web::service
  }
  if str2bool("$basic_http_auth") {
    include graphite::web::auth
  }
}



