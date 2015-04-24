# Class: graphite::carbon
#
# This class manages the configuration of the relay.
# It inherists params from the params class.
# This class setups the relay on the node as standalone or in combination with carbon-caches.
# The config of the relay is done by concatination a part of config to the carbon.conf.
#
# Parameters:
#
# The same as in the carbon.conf file but in lower case and with a prefix corresponding to the config section.
# Example:
#   In carbon.conf:
#   "REPLICATION_FACTOR = 1"
#   In the puppet class definition:
#   "relay_replication_factor => '1',"
#
# Sample uses:
#
class graphite::relay (
  $relay_destinations          = undef,
  $carbon_pickle_receiver_port = $graphite::params::relay_pickle_receiver_port,
) inherits graphite::params {

  file { "${carbon_config_dir}carbon-relay.conf":
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    content => template('graphite/relay/carbon-relay.conf.erb'),
    #notify => Service[$relay_service_name],
  }

  file { '/etc/init.d/carbon-relay':
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0755',
    content => template('graphite/relay/carbon-relay.erb'),
    #notify => Service[$relay_service_name],
  }

  service { $relay_service_name:
    ensure     => $relay_service_enable,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
