# Class: graphite::relay
#
# This class manages the instalation, configuration and service of the carbon relay.
# It inherists params from the params class.
# This class setups the relay on the node as standalone, it will need the destination to where the metrics need to be forwarded as an array.
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
# Setup the relay with defaults:
# class { 'graphite::relay':
#   relay_destinations => ['192.168.1.102','192.168.1.104'],
# }
#
# Use a specific port to sent the metrics to:
# class { 'graphite::relay':
#   relay_destinations          => ['192.168.1.102','192.168.1.104'],
#   carbon_pickle_receiver_port => '2012',
# }

#
class graphite::relay (
  $relay_destinations                = undef,
  $relay_method                      = 'consistent-hashing',
  $carbon_pickle_receiver_port       = $graphite::params::relay_pickle_receiver_port,
  $relay_carbon_metirc_interval      = $graphite::params::relay_carbon_metric_interval,
  $relay_carbon_metric_prefix        = $graphite::params::relay_carbon_metric_perfix,
  $relay_destinations                = $graphite::params::relay_destinations,
  $relay_line_receiver_interface     = $graphite::params::relay_line_receiver_interface,
  $relay_line_receiver_port          = $graphite::params::relay_line_receiver_port,
  $relay_log_listener_connections    = $graphite::params::relay_lig_listener_connections,
  $relay_max_data_points_per_message = $graphite::params::relay_max_data_points_per_message,
  $relay_max_queue_size              = $graphite::params::relay_max_queu_size,
  $relay_pickle_receiver_interface   = $graphite::params::relay_pickle_receiver_interface,
  $relay_pickle_receiver_port        = $graphite::params::relay_pickle_receiver_port,
  $relay_replication_factor          = $graphite::params::relay_replication_factor,
  $relay_service_enable              = $graphite::params::relay_service_enable,
  $relay_service_name                = $graphite::params::relay_service_name,
  $relay_use_flow_control            = $graphite::params::relay_use_flow_control,
  $relay_use_whitelist               = $graphite::params::relay_use_whitelist,
  $relay_user                        = $graphite::params::relay_user,
) inherits graphite::params {
  contain graphite::relay::config
  contain graphite::relay::package
  contain graphite::relay::service
}
