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
class graphite::carbon_aggregator::config {
  file { '/etc/sysconfig/carbon-aggregator':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/graphite/sysconfig/carbon-aggregator',
    notify => Service['carbon-aggregator'],
  }
}
