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
  $manage_httpd = $::graphite::params::manage_httpd,
  $config_dir   = $::graphite::params::config_dir,
  $database_name = $::graphite::params::database_name,
  $database_engine = $::graphite::params::database_engine,
  $database_user = $::graphite::params::database_user,
  $database_password = $::graphite::params::database_password,
  $database_host = $::graphite::params::database_host,
  $database_port = $::graphite::params::database_port,
) inherits graphite::params {
  include graphite::web::params
  include graphite::web::package
  include graphite::web::config
  include graphite::web::service
}

