# Class: graphite::relay::config
#
# This is a private class, do not use inside a manifest/role/profile
#
# Parameters:
#
# $carbon_config_dir:
#   The directory where the carbon config is put in.
#   Default: '/etc/carbon'
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
# Build the relay config file using templates.
# Variables within the 'graphite::relay' scope will be injected in the config.
#
# Requires:
#
# graphite::relay::package
# inherits params from graphite::relay
#
# Sample Usage:
#
# contain graphite::relay::config
#
# [Remember: No empty lines between comments and class definition]
class graphite::relay::config inherits graphite::relay {
  file { "${graphite::relay::carbon_config_dir}carbon-relay.conf":
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    content => template('graphite/relay/carbon-relay.conf.erb'),
    require => Package[$graphite::relay::carbon_package],
    notify  => Service[$graphite::relay::relay_service_name],
  }

  file { '/etc/init.d/carbon-relay':
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0755',
    content => template('graphite/relay/carbon-relay.erb'),
    require => Package[$graphite::relay::carbon_package],
    notify  => Service[$graphite::relay::relay_service_name],
  }

}
