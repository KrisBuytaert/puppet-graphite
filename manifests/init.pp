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
class graphite(
  $local_settings_file = 'UNSET',
  $schema_file         = 'UNSET'
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

  include graphite::carbon
  include graphite::whisper
  include graphite::web

}

