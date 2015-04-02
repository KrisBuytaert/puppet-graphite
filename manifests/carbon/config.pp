# Class: graphite
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
    target  => "${carbon_config_dir}storage-schemas.conf",
    order   => 0,
    content => template('graphite/carbon/storage-schemas.erb'),
  }

  file { "${carbon_config_dir}carbon.conf":
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    content => template('graphite/carbon/carbon.conf.erb'),
  }

}
