# = Class: graphite
#
# This module manages graphite
#
# == Sample Usage:
#
#   include graphite
#
# == Todo:
#
# * Implement user creation.
#
class graphite (
  $manage_httpd = $::graphite::params::manage_httpd,
  $config_dir   = $::graphite::params::config_dir,
  $database_name = $::graphite::params::database_name,
  $database_engine = $::graphite::params::database_engine,
  $database_user = $::graphite::params::database_user,
  $database_password = $::graphite::params::database_password,
  $database_host = $::graphite::params::database_host,
  $database_port = $::graphite::params::database_port,
) inherits graphite::params {
  include graphite::carbon
  include graphite::whisper
  include graphite::config
  class {
    'graphite::web':
      manage_httpd      => $manage_httpd,
      config_dir        => $config_dir,
      database_name     => $database_name,
      database_engine   => $database_engine,
      database_user     => $database_user,
      database_password => $database_password,
      database_host     => $database_host,
      database_port     => $database_port,
  }

}

