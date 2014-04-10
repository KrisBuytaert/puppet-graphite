# = Class: graphite::params
#
class graphite::params {
  $config_dir = $::osfamily ? {
    /(?i:Debian)/ => '/opt/graphite/webapp/graphite',
    /(?i:RedHat)/ => '/etc/graphite-web',
    default       => '/etc/graphite-web',
  }

  $django_root_dir = $::osfamily ? {
    /(?i:Debian)/ => '/opt/graphite/webapp/graphite',
    /(?i:RedHat)/ => '/usr/lib/python2.6/site-packages/graphite',
    default       => '/etc/graphite-web',
  }

  $manage_httpd        = false
  $enable_udp_listener = false

  $database_name       = '/opt/graphite/storage/graphite.db'
  $database_engine     = 'django.db.backends.sqlite3'
  $database_user       = ''
  $database_password   = ''
  $database_host       = ''
  $database_port       = ''

}

