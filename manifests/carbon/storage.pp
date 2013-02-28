# Define: graphite::carbon::storage
#
define graphite::carbon::storage (
  $config_dir = $::graphite::carbon::params::config_dir,
  $pattern    = undef,
  $retentions = undef,
) {

  concat::fragment { $name:
    target  => "${config_dir}/storage-schemas.conf",
    order   => 10,
    content => template('graphite/storage-schemas.erb'),
    notify  => Service['carbon-cache']
  }
}

