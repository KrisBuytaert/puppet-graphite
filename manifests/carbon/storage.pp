# Class: ::graphite::carbon::storage
#
# This class allows for the storage config to be build from fragments declared in the manifest/role/profile.
#
# Parameters:
#
# $carbon_config_dir:
#   The directory where the carbon config is put in.
#   Default: '/etc/carbon'
#
# $carbon_cache_service_name:
#   The name of the carbon-cache service
#   Default: 'carbon-cache'
#
# Sample Usage:
#
#   graphite::carbon::storage {'02_tcpconns_collectd_1_week':
#     pattern        => '\.tcpconns.*',
#     retentions => '60s:1d,300s:7d'
#   }
#
# [Remember: No empty lines between comments and class definition]
define graphite::carbon::storage ( $pattern,$retentions) inherits graphite::carbon {
  concat::fragment {$name:
    target  => "${carbon_config_dir}storage-schemas.conf",
    order   => 10,
    content => template('graphite/carbon/storage-schemas.conf.erb'),
    notify  => Service["${carbon_cache_service_name}"]
  }

}
