# Class: graphite::web::config
#
class graphite::web::config {
  $config_dir   = $::graphite::web::params::config_dir
  $service_name = $::graphite::web::params::service_name

  file { 'local_settings.py':
    ensure    => file,
    path      => "${config_dir}/local_settings.py",
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service[$service_name],
    content   => template('graphite/local_settings.py.erb');
  }

  if $::osfamily == 'Redhat' {
    $graphite_prefix = "/usr/share/graphite"
  } else {
    $graphite_prefix = "/opt/graphite"
  }

  file { "${config_dir}/apache2.conf":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    notify  => Service[$service_name],
    content => template("graphite/apache2.conf.erb");
  }

  if $::osfamily == 'Redhat' {
    file { '/etc/httpd/conf.d/graphite.conf':
      ensure => 'link',
      target => "${config_dir}/apache2.conf",
    }
    file { '/etc/httpd/mod.d/mod_python.load':
      ensure	=> present,
      owner	=> 'root',
      group	=> 'root',
      notify	=> Service[$service_name],
      content	=> template("graphite/mod_python_load.erb")
    }
  }
}

