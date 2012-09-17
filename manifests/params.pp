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
class graphite::params {
  $time_zone           = undef
  $schema_file         = '/etc/carbon/storage-schemas.conf'
  $local_settings_file = '/etc/graphite-web/local_settings.py'
}

