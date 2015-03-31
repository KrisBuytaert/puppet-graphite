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
  concat { '/etc/carbon/storage-schemas.conf':
    group   => '0',
    mode    => '0644',
    owner   => '0',
    notify  => Service['carbon-cache'];
  }
  concat::fragment { 'header':
    target  => '/etc/carbon/storage-schemas.conf',
    order   => 0,
    source  => 'puppet:///modules/graphite/storage-schemas.conf'
  }

  file { '/etc/carbon/carbon.conf':
    group  => 'root',
    owner  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/graphite/carbon.conf'
  }

}
