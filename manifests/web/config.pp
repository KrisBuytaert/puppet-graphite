# Class: graphite::web::config
#
class graphite::web::config {
  file { 'local_settings.py':
    ensure    => file,
    path      => '/etc/graphite-web/local_settings.py',
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service['httpd'],
    content   => template('graphite/local_settings.py.erb');
  }
}

