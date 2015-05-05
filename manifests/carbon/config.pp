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
# $carbon_cache_service_name:
#   The name of the carbon-cache service.
#   Default: 'carbon-cache'
#
# $carbon_package:
#   The name of the carbon package.
#   Default: 'python-carbon'
#
# $relay_service_name:
#   The name of the relay service.
#   Default: 'carbon-relay'
#
# Actions:
#
# Build the config files using templetes.
# Variables within the 'graphite::carbon' scope will be injected in the config.
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

  concat { "${graphite::carbon::carbon_config_dir}storage-schemas.conf":
    group  => '0',
    mode   => '0644',
    owner  => '0',
    notify => Service[$graphite::carbon::carbon_cache_service_name],
  }

  concat::fragment { 'header':
    target => "${graphite::carbon::carbon_config_dir}storage-schemas.conf",
    order  => 0,
    source => 'puppet:///modules/graphite/storage-schemas.conf',
  }

  file { "${graphite::carbon::carbon_config_dir}carbon-cache.conf":
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    content => template('graphite/carbon/carbon-cache.conf.erb'),
    require => Package[$graphite::carbon::carbon_package],
    notify  => Service[$graphite::carbon::carbon_cache_service_name],
  }

  file { '/etc/init.d/carbon-cache':
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0755',
    content => template('graphite/carbon/carbon-cache.erb'),
    require => Package[$graphite::carbon::carbon_package],
    notify  => Service[$graphite::carbon::carbon_cache_service_name],
  }

  file { "${graphite::carbon::carbon_config_dir}carbon-relay.conf":
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    content => template('graphite/carbon/carbon-relay.conf.erb'),
    require => Package[$graphite::carbon::carbon_package],
    notify  => Service[$graphite::carbon::relay_service_name],
  }

  file { '/etc/init.d/carbon-relay':
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0755',
    content => template('graphite/relay/carbon-relay.erb'),
    notify  => Service[$graphite::carbon::relay_service_name],
    }
}
