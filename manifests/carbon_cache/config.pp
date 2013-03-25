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
class graphite::carbon_cache::config {
  file { '/etc/sysconfig/carbon-cache':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/graphite/sysconfig/carbon-cache',
    notify => Service['carbon-cache'],
  }

  include concat::setup

  concat { '/etc/carbon/storage-schemas.conf':
    group  => '0',
    mode   => '0644',
    owner  => '0',
    notify => Service['carbon-cache'];
  }

  concat::fragment { 'carbon-cache_header':
    target => '/etc/carbon/storage-schemas.conf',
    order  => 0,
    source => 'puppet:///modules/graphite/storage-schemas.conf'
  }

  concat { '/etc/carbon/storage-aggregation.conf':
    group  => '0',
    mode   => '0644',
    owner  => '0',
    notify => Service['carbon-cache'];
  }

  concat::fragment { 'carbon-aggregator_header':
    target => '/etc/carbon/storage-aggregation.conf',
    order  => 0,
    source => 'puppet:///modules/graphite/storage-aggregation.conf'
  }
}
