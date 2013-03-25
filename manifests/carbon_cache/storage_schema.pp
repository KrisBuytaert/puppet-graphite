define graphite::carbon_cache::storage_schema (
  $pattern,
  $retentions,
  $order = 10) {
  concat::fragment { $name:
    target  => '/etc/carbon/storage-schemas.conf',
    order   => $order,
    content => template('graphite/storage-schemas.erb'),
    notify  => Service['carbon-cache']
  }
}
