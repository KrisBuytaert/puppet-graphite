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
class graphite::params (
  $carbon_package           = 'python-carbon',
  $carbon_package_ensure  = 'present',
  $carbon_config_dir      = '/etc/carbon',
  $time_zone                = 'UTC',
  $manage_httpd             = false,
  $basic_http_auth          = false,
  $basic_http_auth_password = undef,
  $whisper_dir              = '/var/lib/carbon/whisper/',
) {

}

