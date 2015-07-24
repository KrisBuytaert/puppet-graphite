# = Class: graphite::params
#
# This is a private class, do not use in manifest/role/profile.
#
# == Sample Usage:d
#
#   contain graphite::params
#
class graphite::params (
  $aggregator_carbon_metric_interval         = undef,
  $aggregator_carbon_metric_prefix           = undef,
  $aggregator_write_back_frequenty           = undef,
  $carbon_bind_patterns                      = undef,
  $carbon_carbon_metric_interval             = undef,
  $carbon_carbon_metric_prefix               = undef,
  $carbon_max_updates_per_second_on_shutdown = undef,
  $carbon_use_whitelist                      = undef,
  $carbon_whisper_lock_writes                = undef,
  $carbon_whisper_sparse_create              = undef,
  $relay_carbon_metric_interval              = undef,
  $relay_carbon_metric_prefix                = undef,
  $relay_use_whitelist                       = undef,
  $web_allowed_hosts                         = undef,
  $web_basic_http_auth_password              = undef,
  $web_basic_http_password                   = undef,
  $web_basic_http_user                       = undef,
  $web_debug                                 = undef,
  $web_default_cache_duration                = undef,
  $web_flushrrdcached                        = undef,
  $web_logging                               = undef,
  $web_memcache_hosts                        = undef,
  $web_remote_store_cache_duration           = undef,
  $web_remote_store_fetch_timeout            = undef,
  $web_remote_store_find_timeout             = undef,
  $web_remote_store_retry_delay              = undef,
  $web_secret_key                            = undef,
  $aggregator_destinations                   = '127.0.0.1:2004',
  $aggregator_forward_all                    = 'True',
  $aggregator_line_receiver_interface        = '0.0.0.0',
  $aggregator_line_receiver_port             = '2023',
  $aggregator_log_listener_connections       = 'True',
  $aggregator_max_aggregation_intervals      = '5',
  $aggregator_max_datapoints_per_message     = '500',
  $aggregator_max_queue_size                 = '10000',
  $aggregator_pickle_receiver_interface      = '0.0.0.0',
  $aggregator_pickle_receiver_port           = '2014',
  $aggregator_replication_factor             = '1',
  $aggregator_use_flow_control               = 'True',
  $aggregator_use_whitelist                  = 'False',
  $aggregator_user                           = 'carbon',
  $carbon_ampq_user                          = 'guest',
  $carbon_amqp_exchange                      = 'graphite',
  $carbon_amqp_host                          = 'localhost',
  $carbon_amqp_password                      = 'guest',
  $carbon_amqp_port                          = '5672',
  $carbon_amqp_verbose                       = 'False',
  $carbon_amqp_vhost                         = '/',
  $carbon_cache_amount                       = $::processorcount,
  $carbon_cache_query_port                   = '7002',
  $carbon_cache_service_enable               = 'running',
  $carbon_cache_service_name                 = 'carbon-cache',
  $carbon_cache_write_strategy               = 'sorted',
  $carbon_config_dir                         = '/etc/carbon/',
  $carbon_enable_amqp                        = 'False',
  $carbon_enable_logrotation                 = 'False',
  $carbon_enable_udp_listerner               = 'False',
  $carbon_line_receiver_port                 = '2013',
  $carbon_log_cache_hits                     = 'False',
  $carbon_log_cache_queu_sorts               = 'True',
  $carbon_log_listener_connections           = 'True',
  $carbon_log_updates                        = 'False',
  $carbon_max_cache_size                     = 'inf',
  $carbon_max_creates_per_minute             = '50',
  $carbon_max_updates_per_second             = '500',
  $carbon_package                            = 'python-carbon',
  $carbon_package_ensure                     = 'present',
  $carbon_pickle_receiver_port               = '2015',
  $carbon_udp_receiver_port                  = '2014',
  $carbon_use_flow_control                   = 'True',
  $carbon_use_insecure_unpickler             = 'False',
  $carbon_user                               = 'carbon',
  $carbon_whisper_autoflush                  = 'False',
  $carbon_whisper_fallocate_create           = 'True',
  $caron_metric_name_in_body                 = 'False',
  $relay_destinations                        = '127.0.0.1',
  $relay_line_receiver_interface             = '0.0.0.0',
  $relay_line_receiver_port                  = '2003',
  $relay_log_listener_connections            = 'True',
  $relay_max_data_points_per_message         = '500',
  $relay_max_queue_size                      = '10000',
  $relay_pickle_receiver_interface           = '0.0.0.0',
  $relay_pickle_receiver_port                = '2004',
  $relay_replication_factor                  = '1',
  $relay_service_enable                      = 'running',
  $relay_service_name                        = 'carbon-relay',
  $relay_use_flow_control                    = 'True',
  $relay_user                                = 'carbon',
  $web_basic_http_auth                       = false,
  $web_conf_dir                              = '/etc/graphite-web',
  $web_content_dir                           = '/usr/share/graphite/webapp/content',
  $web_data_dirs                             = '[WHISPER_DIR, RRD_DIR]',
  $web_dir                                   = '/etc/graphite-web/',
  $web_graphite_root                         = '/usr/share/graphite/',
  $web_group                                 = 'apache',
  $web_index_file                            = '/var/lib/graphite-web/index',
  $web_database_file                         = '/var/lib/graphite-web/graphite.db',
  $web_log_cache_performance                 = 'True',
  $web_log_dir                               = '/var/log/graphite-web/',
  $web_log_metric_access                     = 'True',
  $web_log_rendering_performance             = 'True',
  $web_manage_db_setup                       = true,
  $web_manage_httpd                          = true,
  $web_package                               = ['bitmap-fonts-compat','graphite-web'],
  $web_package_ensure                        = 'installed',
  $web_port                                  = '80',
  $web_rrd_dir                               = '/var/lib/carbon/rrd',
  $web_service_enable                        = 'running',
  $web_service_name                          = 'httpd',
  $web_storage_dir                           = '/var/lib/graphite-web',
  $web_time_zone                             = 'UTC',
  $web_user                                  = 'apache',
  $whisper_dir                               = '/var/lib/carbon/whisper/',
  $whisper_package                           = 'python-whisper',
  $whisper_package_ensure                    = 'present',
) {
}

