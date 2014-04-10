# Class: graphite::web::params
#
class graphite::web::params {
  $graphite_root = $::osfamily ? {
    /(?i:Debian)/ => undef,
    /(?i:RedHat)/ => '/var/lib/graphite-web',
    default       => undef,
  }
  $config_dir = $::osfamily ? {
    /(?i:Debian)/ => '/opt/graphite/webapp/graphite',
    /(?i:RedHat)/ => '/etc/graphite-web',
    default       => '/etc/graphite-web',
  }
  $whisper_dir = $::osfamily ? {
    /(?i:Debian)/ => '/opt/graphite/storage/whisper/',
    /(?i:RedHat)/ => '/var/lib/carbon/whisper/',
    default       => '/var/lib/carbon/whisper/',
  }
  $http_config_dir = $::osfamily ? {
    /(?i:Debian)/ => '/opt/graphite/webapp/graphite',
    /(?i:RedHat)/ => '/etc/httpd/conf.d',
    default       => '/etc/graphite-web',
  }

  $log_dir = '/var/log/graphite-web'

  $service_name = $::osfamily ? {
    /(?i:Debian)/ => 'apache2',
    /(?i:RedHat)/ => 'httpd',
    default       => 'httpd',
  }
}

