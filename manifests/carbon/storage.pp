define graphite::carbon::storage ( $pattern,$retentions) inherits graphite::carbon {
  concat::fragment {$name:
    target  => "${carbon_config_dir}storage-schemas.conf",
    order   => 10,
    content => template('graphite/carbon/storage-schemas.conf.erb'),
    notify  => Service['carbon-cache']
  }

}
