# Class: ::graphite::carbon::config
#
# This is a private class, do not use inside a manifest/role/profile
#
# Parameters:
#
# $carbon_config_dir:
#   The directory where the carbon config is put in.
#   Default: '/etc/carbon/'
#
# Actions:
#
# Build the config files using templetes.
# Variables withing the 'graphite::carbon' scope will be injected in the config.
#
# Requires:
#
# graphite::carbon::package
# inherits params from graphite::carbon
#
# Sample Usage:
#
# contain graphite::carbon::config
#
# [Remember: No empty lines between comments and class definition]
class graphite::carbon::config inherits graphite::carbon {

  concat { "${carbon_config_dir}storage-schemas.conf":
    group   => '0',
    mode    => '0644',
    owner   => '0',
    notify  => Service['carbon-cache'],
  }

  concat::fragment { 'header':
    target => "${carbon_config_dir}storage-schemas.conf",
    order  => 0,
    source => 'puppet:///modules/graphite/storage-schemas.conf',
  }

  file { "${carbon_config_dir}carbon-cache.conf":
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    content => template('graphite/carbon/carbon-cache.conf.erb'),
    notify  => Service[$carbon_cache_service_name],
  }

  file { '/etc/init.d/carbon-cache':
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0755',
    content => template('graphite/carbon/carbon-cache.erb'),
    notify  => Service[$carbon_cache_service_name],
  }

  file { "${carbon_config_dir}carbon-relay.conf":
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    content => template('graphite/carbon/carbon-relay.conf.erb'),
    notify => Service[$relay_service_name],
  }

  file { '/etc/init.d/carbon-relay':
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0755',
    content => template('graphite/relay/carbon-relay.erb'),
    notify => Service[$relay_service_name],
    }
}
