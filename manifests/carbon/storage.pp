# Class: graphite::carbon::storage
#
define graphite::carbon::storage (
  $pattern    = undef,
  $retentions = undef,
) {
  concat::fragment { $name:
    target  => '/etc/carbon/storage-schemas.conf',
    order   => 10,
    content => template('graphite/storage-schemas.erb'),
    notify  => Service['carbon-cache']
  }
}

