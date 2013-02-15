# Class: graphite::carbon::config
#
class graphite::carbon::config {
  include concat::setup

  concat { '/etc/carbon/storage-schemas.conf':
    group  => '0',
    mode   => '0644',
    owner  => '0',
    notify => Service['carbon-cache'];
  }

  concat::fragment { 'header':
    target => '/etc/carbon/storage-schemas.conf',
    order  => 0,
    source => 'puppet:///modules/graphite/storage-schemas.conf',
  }

  if $::osfamily == 'Debian' {
    file { '/etc/init.d/carbon-cache':
      ensure  => present,
      content => template('graphite/carbon-cache_Debian.init'),
    }
  }
}

