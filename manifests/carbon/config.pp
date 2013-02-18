# Class: graphite::carbon::config
#
class graphite::carbon::config {
  include concat::setup

  $config_dir   = $::graphite::carbon::params::config_dir
  $service_name = $::graphite::carbon::params::service_name

  concat { "${config_dir}/storage-schemas.conf":
    group  => '0',
    mode   => '0644',
    owner  => '0',
    notify => Service['carbon-cache'];
  }

  concat::fragment { 'header':
    target => "${config_dir}/storage-schemas.conf",
    order  => 0,
    source => 'puppet:///modules/graphite/storage-schemas.conf',
  }

  if $::osfamily == 'Debian' {
    file { '/etc/init.d/carbon-cache':
      ensure  => present,
      owner   => '0',
      mode    => '0755',
      group   => '0',
      content => template('graphite/carbon-cache_Debian.init'),
      before  => Service[$service_name],
    }
  }
}

