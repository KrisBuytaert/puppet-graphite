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

  include ::logrotate
  logrotate::file {'carbon':
    log        => '/var/log/carbon/console.log',
    options    => [
      'daily',
      'missingok',
      'rotate 7',
      'compress',
      'delaycompress',
      'notifempty',
      ],
  }


}
