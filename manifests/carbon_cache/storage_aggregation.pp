define graphite::carbon_cache::storage_aggregation (
  $pattern,
  $xfilesfactor,
  $aggregationmethod,
  $order = 10) {
  concat::fragment { $name:
    target  => '/etc/carbon/storage-aggregation.conf',
    order   => $order,
    content => template('graphite/storage-aggregation.erb'),
    notify  => Service['carbon-cache']
  }
}
