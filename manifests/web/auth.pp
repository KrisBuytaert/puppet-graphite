# Class: graphite
#
# This module manages graphite
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class graphite::web::auth (
  $basic_http_auth = false,
  $basic_http_auth_password = undef,
  ){

  file {'/etc/httpd/conf.d/graphite-web.conf':
    ensure    => file,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service['httpd'],
    content   => template('graphite/graphite-web.conf.erb');
  }

  file {'/usr/share/graphite/.htpasswd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "inuits:${basic_http_auth_password}",
  }
}
