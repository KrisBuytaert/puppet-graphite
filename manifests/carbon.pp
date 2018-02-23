# Class: graphite::carbon
#
# This class manages the carbon package, configuration and service.
# It inherists params from the params class.
# There is some param logic in this class to sort out the interface to use for carbon.
# This class calls the graphite::carbon::package, graphite::carbon::config and graphite::carbon::service classes.
#
# The multiple carbon caches require a carbon-relay to function properly. Including graphite::carbon::cache will setup the carbon-relay if there are multiple caches configured.
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
# Install carbon with defaults:
# include ::graphite::carbon
#
# Install carbon with a different package name:
# class { '::graphite::carbon':
#   carbon_package => 'python-carbon',
# }
#
# Use specific ports:
# class { '::graphite::carbon':
#   carbon_line_receiver_port   => '2014',
#   carbon_udp_receiver_port    => '2013',
#   carbon_pickle_receiver_port => '2012',
#   carbon_cache_query_port     => '7000',
# }
# When using multiple caches, the port numbers will be incremented by 10.
# For example while using the above class will make a multiple cache definition like this:
# [cache:1]
# LINE_RECEIVER_PORT = 2014
# UDP_RECEIVER_PORT = 2013
# PICKLE_RECEIVER_PORT = 2012
# CACHE_QUERY_PORT = 7000
#
# [cache:2]
# LINE_RECEIVER_PORT = 2024
# UDP_RECEIVER_PORT = 2023
# PICKLE_RECEIVER_PORT = 2022
# CACHE_QUERY_PORT = 7010
#
# The same will happen to the destinations param:
# DESTINATIONS = 127.0.0.1:2012:1,127.0.0.1:2022:2,
#
class graphite::carbon (
  $aggregator_carbon_metric_interval         = $graphite::params::aggregator_carbon_metric_interval,
  $aggregator_carbon_metric_prefix           = $graphite::params::aggregator_carbon_metric_prefix,
  $aggregator_destinations                   = $graphite::params::aggregator_destinations,
  $aggregator_forward_all                    = $graphite::params::aggregator_forward_all,
  $aggregator_line_receiver_interface        = $graphite::params::aggregator_line_receiver_interface,
  $aggregator_line_receiver_port             = $graphite::params::aggregator_line_receiver_port,
  $aggregator_log_listener_connections       = $graphite::params::aggregator_log_listener_connections,
  $aggregator_max_aggregation_intervals      = $graphite::params::aggregator_max_aggregation_intervals,
  $aggregator_max_datapoints_per_message     = $graphite::params::aggregator_max_datapoints_per_message,
  $aggregator_max_queue_size                 = $graphite::params::aggregator_max_queue_size,
  $aggregator_pickle_receiver_interface      = $graphite::params::aggregator_pickle_receiver_interface,
  $aggregator_pickle_receiver_port           = $graphite::params::aggregator_pickle_receiver_port,
  $aggregator_replication_factor             = $graphite::params::aggregator_replication_factor,
  $aggregator_use_flow_control               = $graphite::params::aggregator_use_flow_control,
  $aggregator_use_whitelist                  = $graphite::params::aggregator_use_whitelist,
  $aggregator_user                           = $graphite::params::aggregator_user,
  $aggregator_write_back_frequenty           = $graphite::params::aggregator_write_back_frequenty,
  $basic_http_auth                           = $graphite::params::basic_http_auth,
  $basic_http_auth_password                  = $graphite::params::basic_httpd_auth_password,
  $carbon_ampq_user                          = $graphite::params::carbon_amqp_user,
  $carbon_amqp_exchange                      = $graphite::params::carbon_amqp_exchange,
  $carbon_amqp_host                          = $graphite::params::carbon_amqp_host,
  $carbon_amqp_password                      = $graphite::params::carbon_amqp_password,
  $carbon_amqp_port                          = $graphite::params::carbon_amqp_port,
  $carbon_amqp_verbose                       = $graphite::params::carbon_amqp_verbose,
  $carbon_amqp_vhost                         = $graphite::params::carbon_amqp_vhost,
  $carbon_bind_patterns                      = $graphite::params::carbon_bind_patterns,
  $carbon_cache_amount                       = $graphite::params::carbon_cache_amount,
  $carbon_cache_query_interface              = $graphite::params::carbon_cache_query_interface,
  $carbon_cache_query_port                   = $graphite::params::carbon_cache_query_port,
  $carbon_cache_service_ensure               = $graphite::params::carbon_cache_service_ensure,
  $carbon_cache_service_name                 = $graphite::params::carbon_cache_service_name,
  $carbon_cache_write_strategy               = $graphite::params::carbon_cache_write_strategy,
  $carbon_carbon_metric_interval             = $graphite::params::carbon_carbon_metric_interval,
  $carbon_carbon_metric_prefix               = $graphite::params::carbon_carbon_metric_prefix,
  $carbon_config_dir                         = $graphite::params::carbon_config_dir,
  $carbon_enable_amqp                        = $graphite::params::carbon_enable_amqp,
  $carbon_enable_logrotation                 = $graphite::params::carbon_enable_logrotation,
  $carbon_enable_udp_listerner               = $graphite::params::carbon_enable_udp_listerner,
  $carbon_line_receiver_interface            = $graphite::params::carbon_line_receiver_interface,
  $carbon_line_receiver_port                 = $graphite::params::carbon_line_receiver_port,
  $carbon_log_cache_hits                     = $graphite::params::carbon_log_cache_hits,
  $carbon_log_cache_queu_sorts               = $graphite::params::carbon_log_cache_queu_sorts,
  $carbon_log_listener_connections           = $graphite::params::carbon_log_listener_connections,
  $carbon_log_updates                        = $graphite::params::carbon_log_updates,
  $carbon_max_cache_size                     = $graphite::params::carbon_max_cache_size,
  $carbon_max_creates_per_minute             = $graphite::params::carbon_max_creates_per_minute,
  $carbon_max_updates_per_second             = $graphite::params::carbon_max_updates_per_second,
  $carbon_max_updates_per_second_on_shutdown = $graphite::params::carbon_max_updates_per_second_on_shutdown,
  $carbon_package                            = $graphite::params::carbon_package,
  $carbon_package_ensure                     = $graphite::params::carbon_package_ensure,
  $carbon_pickle_receiver_interface          = $graphite::params::carbon_pickle_receiver_interface,
  $carbon_pickle_receiver_port               = $graphite::params::carbon_pickle_receiver_port,
  $carbon_udp_receiver_interface             = $graphite::params::carbon_udp_receiver_interface,
  $carbon_udp_receiver_port                  = $graphite::params::carbon_udp_receiver_port,
  $carbon_use_flow_control                   = $graphite::params::carbon_use_flow_control,
  $carbon_use_insecure_unpickler             = $graphite::params::carbon_use_insecure_unpickler,
  $carbon_use_whitelist                      = $graphite::params::carbon_use_whitelist,
  $carbon_user                               = $graphite::params::carbon_user,
  $carbon_whisper_autoflush                  = $graphite::params::carbon_whisper_autoflush,
  $carbon_whisper_fallocate_create           = $graphite::params::carbon_whisper_fallocate_create,
  $carbon_whisper_lock_writes                = $graphite::params::carbon_whisper_lock_writes,
  $carbon_whisper_sparse_create              = $graphite::params::carbon_whisper_sparse_create,
  $caron_metric_name_in_body                 = $graphite::params::carbon_metric_name_in_body,
  $manage_httpd                              = $graphite::params::manage_httpd,
  $relay_carbon_metirc_interval              = $graphite::params::relay_carbon_metric_interval,
  $relay_carbon_metric_prefix                = $graphite::params::relay_carbon_metric_prefix,
  $relay_destinations                        = $graphite::params::relay_destinations,
  $relay_line_receiver_interface             = $graphite::params::relay_line_receiver_interface,
  $relay_line_receiver_port                  = $graphite::params::relay_line_receiver_port,
  $relay_log_listener_connections            = $graphite::params::relay_log_listener_connections,
  $relay_max_data_points_per_message         = $graphite::params::relay_max_data_points_per_message,
  $relay_max_queue_size                      = $graphite::params::relay_max_queue_size,
  $relay_method                              = $graphite::params::relay_method,
  $relay_pickle_receiver_interface           = $graphite::params::relay_pickle_receiver_interface,
  $relay_pickle_receiver_port                = $graphite::params::relay_pickle_receiver_port,
  $relay_replication_factor                  = $graphite::params::relay_replication_factor,
  $relay_use_flow_control                    = $graphite::params::relay_use_flow_control,
  $relay_use_whitelist                       = $graphite::params::relay_use_whitelist,
  $relay_user                                = $graphite::params::relay_user,
  $whisper_dir                               = $graphite::params::whisper_dir,
  $web_allowed_hosts                         = $graphite::params::web_allowed_hosts,
  $web_basic_http_auth                       = $graphite::params::web_basic_http_auth,
  $web_basic_http_auth_password              = $graphite::params::web_basic_http_auth_password,
  $web_basic_http_password                   = $graphite::params::web_basic_http_password,
  $web_basic_http_user                       = $graphite::params::web_basic_http_user,
  $web_conf_dir                              = $graphite::params::web_conf_dir,
  $web_content_dir                           = $graphite::params::web_content_dir,
  $web_data_dirs                             = $graphite::params::web_data_dirs,
  $web_debug                                 = $graphite::params::web_debug,
  $web_default_cache_duration                = $graphite::params::web_default_cache_duration,
  $web_dir                                   = $graphite::params::web_dir,
  $web_flushrrdcached                        = $graphite::params::web_flushrrdcached,
  $web_graphite_root                         = $graphite::params::web_graphite_root,
  $web_group                                 = $graphite::params::web_group,
  $web_index_file                            = $graphite::params::web_index_file,
  $web_log_cache_performance                 = $graphite::params::web_log_cache_performance,
  $web_log_dir                               = $graphite::params::web_log_dir,
  $web_log_metric_access                     = $graphite::params::web_log_metric_access,
  $web_log_rendering_performance             = $graphite::params::web_log_rendering_performance,
  $web_logging                               = $graphite::params::web_logging,
  $web_manage_db_setup                       = $graphite::params::web_manage_db_setup,
  $web_manage_httpd                          = $graphite::params::web_manage_httpd,
  $web_memcache_hosts                        = $graphite::params::web_memcache_hosts,
  $web_package                               = $graphite::params::web_package,
  $web_package_ensure                        = $graphite::params::web_package_ensure,
  $web_port                                  = $graphite::params::web_port,
  $web_remote_store_cache_duration           = $graphite::params::web_remote_store_cache_duration,
  $web_remote_store_fetch_timeout            = $graphite::params::web_remote_store_fetch_timeout,
  $web_remote_store_find_timeout             = $graphite::params::web_remote_store_find_timeout,
  $web_remote_store_retry_delay              = $graphite::params::web_remote_store_retry_delay,
  $web_rrd_dir                               = $graphite::params::web_rrd_dir,
  $web_secret_key                            = $graphite::params::web_secret_key,
  $web_service_enable                        = $graphite::params::web_service_enable,
  $web_service_name                          = $graphite::params::web_service_name,
  $web_storage_dir                           = $graphite::params::web_storage_dir,
  $web_time_zone                             = $graphite::params::web_time_zone,
  $web_user                                  = $graphite::params::web_user,
) inherits ::graphite {


  contain graphite::carbon::package
  contain graphite::carbon::config
  contain graphite::carbon::service
  contain graphite::carbon::whisper
  # Setup graphite web with the right params.
  class { 'graphite::web':
    web_allowed_hosts               => $web_allowed_hosts,
    web_basic_http_auth             => $web_basic_http_auth,
    web_basic_http_auth_password    => $web_basic_http_auth_password,
    web_basic_http_password         => $web_basic_http_password,
    web_basic_http_user             => $web_basic_http_user,
    web_conf_dir                    => $web_conf_dir,
    web_content_dir                 => $web_content_dir,
    web_data_dirs                   => $web_data_dirs,
    web_debug                       => $web_debug,
    web_default_cache_duration      => $web_default_cache_duration,
    web_dir                         => $web_dir,
    web_flushrrdcached              => $web_flushrrdcached,
    web_graphite_root               => $web_graphite_root,
    web_group                       => $web_group,
    web_index_file                  => $web_index_file,
    web_log_cache_performance       => $web_log_cache_performance,
    web_log_dir                     => $web_log_dir,
    web_log_metric_access           => $web_log_metric_access,
    web_log_rendering_performance   => $web_log_rendering_performance,
    web_logging                     => $web_logging,
    web_manage_db_setup             => $web_manage_db_setup,
    web_manage_httpd                => $web_manage_httpd,
    web_memcache_hosts              => $web_memcache_hosts,
    web_package                     => $web_package,
    web_package_ensure              => $web_package_ensure,
    web_port                        => $web_port,
    web_remote_store_cache_duration => $web_remote_store_cache_duration,
    web_remote_store_fetch_timeout  => $web_remote_store_fetch_timeout,
    web_remote_store_find_timeout   => $web_remote_store_find_timeout,
    web_remote_store_retry_delay    => $web_remote_store_retry_delay,
    web_rrd_dir                     => $web_rrd_dir,
    web_secret_key                  => $web_secret_key,
    web_service_enable              => $web_service_enable,
    web_service_name                => $web_service_name,
    web_storage_dir                 => $web_storage_dir,
    web_time_zone                   => $web_time_zone,
    web_user                        => $web_user,
  }
}
