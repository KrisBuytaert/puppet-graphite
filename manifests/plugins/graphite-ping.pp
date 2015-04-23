# == Class: graphite::plugins::graphite-ping
#
# This class provides a graphite-ping plugin.
#
# source: https://github.com/dmsasser/graphiteutils

define graphite::plugins::graphite-ping {

  $host = $name

  if !defined(Package['nc']){
    package { 'nc':
      ensure => installed,
    }
  }

  if !defined(File["/etc/cron.hourly/99graphite-ping-${host}"]){
    file { "/etc/cron.hourly/99graphite-ping-${host}":
      path    => "/etc/cron.hourly/99graphite-ping-${host}",
      owner   => root,
      group   => root,
      mode    => '0775',
      content => template('graphite/plugins/graphite-ping.erb'),
    }
  }

  if !defined(File['/usr/local/sbin/graphite-ping']){
    file { '/usr/local/sbin/graphite-ping':
      ensure  => present,
      path    => '/usr/local/sbin/graphite-ping',
      owner   => root,
      group   => root,
      mode    => '0755',
      source  => 'puppet:///modules/graphite/plugins/graphite-ping',
    }
  }

}
