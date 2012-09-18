# = Class: graphite
#
# This module manages graphite
#
# == Parameters
#  local_settins_file: path to the graphite web local_settings.py file
#  schema_file: path to the storage-schemas.conf file
#  time_zone: time zone to set in local_settings.py file
# == Sample Usage:
#
#   include graphite
#
# == Todo:
#
# * Implement user creation.
#
class graphite(
  $local_settings_file = 'UNSET',
  $schema_file         = 'UNSET',
  $time_zone           = 'UNSET'
){

  include graphite::params

  $r_local_settings_file = $local_settings_file ? {
    'UNSET' => $graphite::params::local_settings_file,
    default => $local_settings_file
  }

  $r_schema_file = $schema_file ? {
    'UNSET' => $graphite::params::schema_file,
    default => $schema_file,
  }

  $r_time_zone = $time_zone ? {
    'UNSET' => $graphite::params::time_zone,
    default => $time_zone,
  }

  include graphite::carbon
  include graphite::whisper
  include graphite::web

}

