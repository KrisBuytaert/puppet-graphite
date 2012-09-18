# = Class: graphite
#
# This module manages graphite
#
# == Parameters
#  local_settings_file: path to the graphite web local_settings.py file
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
class graphite
{

  require graphite::params

  $r_local_settings_file = $graphite::params::local_settings_file
  $r_schema_file         = $graphite::params::schema_file
  $r_time_zone           = $graphite::params::time_zone

  include graphite::carbon
  include graphite::whisper
  include graphite::web

}

