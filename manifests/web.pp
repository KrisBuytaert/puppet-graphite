# Class: graphite::web
#
# This class manages the graphite webfrontend.
#
# Parameters:
#
# The same as in the local_settings.py file.
# Example:
#  In local_settings.py:
#  TIME_ZONE = 'UTC'
#  In the puppet class definition:
#  time_zone => 'UTC',
#
# Sample Uses:
#
# Setup graphite web with defaults:
# include graphite::web
#
# Setup graphite web and let it manage the webserver:
# class { 'graphite::web':
#   manage_httpd => True,
# }
#
class graphite::web (
  $cluster_servers                 = undef,
  $web_allowed_hosts               = $::graphite::params::web_allowed_hosts,
  $web_basic_http_auth             = $::graphite::params::web_basic_http_auth,
  $web_basic_http_auth_password    = $::graphite::params::web_basic_http_auth_password,
  $web_basic_http_password         = $::graphite::params::web_basic_http_password,
  $web_basic_http_user             = $::graphite::params::web_basic_http_user,
  $web_conf_dir                    = $::graphite::params::web_conf_dir,
  $web_content_dir                 = $::graphite::params::web_content_dir,
  $web_data_dirs                   = $::graphite::params::web_data_dirs,
  $web_debug                       = $::graphite::params::web_debug,
  $web_default_cache_duration      = $::graphite::params::web_default_cache_duration,
  $web_dir                         = $::graphite::params::web_dir,
  $web_flushrrdcached              = $::graphite::params::web_flushrrdcached,
  $web_graphite_root               = $::graphite::params::web_graphite_root,
  $web_index_file                  = $::graphite::params::web_index_file,
  $web_log_cache_performance       = $::graphite::params::web_log_cache_performance,
  $web_log_dir                     = $::graphite::params::web_log_dir,
  $web_log_metic_access            = $::graphite::params::web_log_metric_access,
  $web_log_rendering_performance   = $::graphite::params::web_log_rendering_performance,
  $web_logging                     = $::graphite::params::web_logging,
  $web_manage_db_setup             = $::graphite::params::web_manage_db_setup,
  $web_manage_httpd                = $::graphite::params::web_manage_httpd,
  $web_memcache_hosts              = $::graphite::params::web_memcache_hosts,
  $web_package                     = $::graphite::params::web_package,
  $web_package_ensure              = $::graphite::params::web_package_ensure,
  $web_port                        = $::graphite::params::web_port,
  $web_remote_store_cache_duration = $::graphite::params::web_remote_store_cache_duration,
  $web_remote_store_fetch_timeout  = $::graphite::params::web_remote_store_fetch_timeout,
  $web_remote_store_find_timeout   = $::graphite::params::web_remote_store_find_timeout,
  $web_remote_store_retry_delay    = $::graphite::params::web_remote_store_retry_delay,
  $web_rrd_dir                     = $::graphite::params::web_rrd_dir,
  $web_secret_key                  = $::graphite::params::web_secret_key,
  $web_service_enable              = $::graphite::params::web_service_enable,
  $web_service_name                = $::graphite::params::web_service_name,
  $web_storage_dir                 = $::graphite::params::web_storage_dir,
  $web_time_zone                   = $::graphite::params::web_time_zone,
) inherits ::graphite::params {
  contain graphite::web::package
  contain graphite::web::config

  if str2bool("${web_manage_httpd}") {
    include graphite::web::service
  }
  if str2bool("${web_basic_http_auth}") {
    include graphite::web::auth
  }
}
