# Class: graphite::web
#
# This class manages the graphite webfrontend.
#
# Parameters:
#
# The same as in the local_settings.py file.
# Example:
#  In local_settings.py:
#  TIME_ZONE = 'UTC'
#  In the puppet class definition:
#  time_zone => 'UTC',
#
# Sample Uses:
#
# Setup graphite web with defaults:
# include graphite::web
#
# Setup graphite web and let it manage the webserver:
# class { 'graphite::web':
#   manage_httpd => True,
# }
#
class graphite::web (
  $cluster_servers          = undef,
  $time_zone                = $::graphite::params::web_time_zone,
  $whisper_dir              = $::graphite::params::whisper_dir,
  $manage_httpd             = $::graphite::params::web_manage_httpd,
  $basic_http_auth          = $::graphite::params::web_basic_http_auth,
  $basic_http_auth_password = $::graphite::params::web_basic_http_auth_password,
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
