# == Class: graphite::plugins::graphite-ping
#
# This class provides a graphite-ping plugin.
#
# source: https://github.com/dmsasser/graphiteutils

define graphite::plugins::graphite-ping ($host){
  if !defined(Package['nc']){
    package { 'nc':
      ensure => installed,
    }
  }

  if !defined(File["/etc/cron.hourly/99graphite-ping-${host}"]{
    file { "/etc/cron.hourly/99graphite-ping-${host}":
      path    => "/etc/cron.hourly/99graphite-ping-${host}",
      user    => root,
      group   => root,
      mode    => 0775,
      content => template('plugins/graphite-ping.erb'),
  }

  if !defined(File['/usr/local/sbin/graphite-ping']{
    file { 'graphite-ping':
    path    => '/usr/local/sbin/graphite-ping',
    ensure  => present,
    mode    => 0755,
    content => 'puppet:///graphite/plugins/graphite-ping',
    }
  }

}
