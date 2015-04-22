# = Class: graphite::params
#
# This is a private class, do not use in manifest/role/profile.
#
# == Sample Usage:d
#
#   contain graphite::params
#
class graphite::params (
  $carbon_cache_service_name                 = 'carbon-cache',
  $carbon_cache_service_enable               = 'running',
  $carbon_package                            = 'python-carbon',
  $carbon_package_ensure                     = 'present',
  $carbon_cache_amount                       = $::processorcount,
  $time_zone                                 = 'UTC',
  $manage_httpd                              = false,
  $basic_http_auth                           = false,
  $basic_http_auth_password                  = undef,
  $whisper_dir                               = '/var/lib/carbon/whisper/',
  $carbon_config_dir                         = '/etc/carbon/',
  $carbon_enable_logrotation                 = 'False',
  $carbon_user                               = 'carbon',
  $carbon_max_cache_size                     = 'inf',
  $carbon_max_updates_per_second             = '500',
  $carbon_max_updates_per_second_on_shutdown = undef,
  $carbon_max_creates_per_minute             = '50',
  $carbon_line_receiver_port                 = '2013',
  $carbon_enable_udp_listerner               = 'False',
  $carbon_udp_receiver_port                  = '2003',
  $carbon_pickle_receiver_port               = '2014',
  $carbon_log_listener_connections           = 'True',
  $carbon_use_insecure_unpickler             = 'False',
  $carbon_cache_query_port                   = '7002',
  $carbon_use_flow_control                   = 'True',
  $carbon_log_updates                        = 'False',
  $carbon_log_cache_hits                     = 'False',
  $carbon_log_cache_queu_sorts               = 'True',
  $carbon_cache_write_strategy               = 'sorted',
  $carbon_whisper_autoflush                  = 'False',
  $carbon_whisper_sparse_create              = undef,
  $carbon_whisper_fallocate_create           = 'True',
  $carbon_whisper_lock_writes                = undef,
  $carbon_use_whitelist                      = undef,
  $carbon_carbon_metric_prefix               = undef,
  $carbon_carbon_metric_interval             = undef,
  $carbon_enable_amqp                        = 'False',
  $carbon_amqp_verbose                       = 'False',
  $carbon_amqp_host                          = 'localhost',
  $carbon_amqp_port                          = '5672',
  $carbon_amqp_vhost                         = '/',
  $carbon_ampq_user                          = 'guest',
  $carbon_amqp_password                      = 'guest',
  $carbon_amqp_exchange                      = 'graphite',
  $caron_metric_name_in_body                 = 'False',
  $carbon_bind_patterns                      = undef,
  $relay_user                                = 'carbon',
  $relay_line_receiver_interface             = '0.0.0.0',
  $relay_line_receiver_port                  = '2013',
  $relay_pickle_receiver_interface           = '0.0.0.0',
  $relay_pickle_receiver_port                = '2014',
  $relay_log_listener_connections            = 'True',
  $relay_replication_factor                  = '1',
  $relay_destinations                        = '127.0.0.1',
  $relay_max_data_points_per_message         = '500',
  $relay_max_queue_size                      = '10000',
  $relay_use_flow_control                    = 'True',
  $relay_use_whitelist                       = undef,
  $relay_carbon_metric_prefix                = undef,
  $relay_carbon_metirc_interval              = undef,
  $aggregator_user                           = 'carbon',
  $aggregator_line_receiver_interface        = '0.0.0.0',
  $aggregator_line_receiver_port             = '2023',
  $aggregator_pickle_receiver_interface      = '0.0.0.0',
  $aggregator_pickle_receiver_port           = '2014',
  $aggregator_log_listener_connections       = 'True',
  $aggregator_forward_all                    = 'True',
  $aggregator_destinations                   = '127.0.0.1:2004',
  $aggregator_replication_factor             = '1',
  $aggregator_max_queue_size                 = '10000',
  $aggregator_use_flow_control               = 'True',
  $aggregator_max_datapoints_per_message     = '500',
  $aggregator_max_aggregation_intervals      = '5',
  $aggregator_write_back_frequenty           = undef,
  $aggregator_use_whitelist                  = 'False',
  $aggregator_carbon_metric_prefix           = undef,
  $aggregator_carbon_metric_interval         = undef,
  $graphite_web_dir                          = '/etc/graphite-web/'
) {

  if $carbon_cache_amount > 1 {
    $carbon_line_receiver_interface  = '127.0.0.1'
    $carbon_udp_receiver_interface   = '127.0.0.1'
    $carbon_pickle_receiver_iterface = '127.0.0.1'
    $carbon_cache_query_interface    = '127.0.0.1'
    $relay_method                    = 'consistent-hashing'
  } else {
    $carbon_line_receiver_interface  = '0.0.0.0'
    $carbon_udp_receiver_interface   = '0.0.0.0'
    $carbon_pickle_receiver_iterface = '0.0.0.0'
    $carbon_cache_query_interface    = '0.0.0.0'
    $relay_method                    = 'rules'
  }
}

