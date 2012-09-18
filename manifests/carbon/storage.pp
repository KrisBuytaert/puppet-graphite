# Define graphite::carbon::storage
#
# Configure carbon storage schemas
#
# Parameters:
#   pattern: Pattern to match metric agains
#   retentions: Retentions for the metric as a string
#
define graphite::carbon::storage ( $pattern,$retentions){
  concat::fragment {$name:
    target  => $graphite::r_schema_file,
    order   => 10,
    content => template('graphite/storage-schemas.erb'),
    notify  => Service['carbon']
  }
}
