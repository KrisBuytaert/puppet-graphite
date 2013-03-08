# = Class: graphite::params
#
class graphite::params {
  $config_dir = $::osfamily ? {
    /(?i:Debian)/ => '/opt/graphite/webapp/graphite',
    /(?i:RedHat)/ => '/etc/graphite-web',
    default       => '/etc/graphite-web',
  }

  $manage_httpd      = false
  $vhost_serveralias = undef
  $vhost_servername  = $::fqdn
}

