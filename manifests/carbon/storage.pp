define graphite::carbon::storage ( $pattern,$retentions){
  concat::fragment {$name:
    target  => '/etc/carbon/storage-schemas.conf',
    order   => 10,
    content => template('graphite/storage-schemas.erb'),
    notify  => Service['carbon-cache']
  }

}
