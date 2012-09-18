# Class: graphite
#
# This module manages graphite
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class graphite::carbon::config {
  include concat::setup
  concat { $graphite::r_schema_file:
    group   => '0',
    mode    => '0644',
    owner   => '0',
    notify  => Service['carbon'];
  }
  concat::fragment { 'header':
    target  => $graphite::r_schema_file,
    order   => 0,
    source  => 'puppet:///modules/graphite/storage-schemas.conf'
  }
}
