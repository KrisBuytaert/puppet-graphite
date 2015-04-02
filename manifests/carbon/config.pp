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
