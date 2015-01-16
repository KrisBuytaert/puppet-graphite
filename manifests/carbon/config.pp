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

  #Set up logrotation to deal with the logs
  include ::logrotate
  logrotate::file{'carbon':
    log     => '/var/log/carbon/*.log',
    options => [
      'daily',
      'rotate 7',
      'compress',
      'delaycompress',
      'missingok',
      'postrotate',
      '/etc/init.d/carbon-cache restart',
      'endscript',
    ]
  }

}
