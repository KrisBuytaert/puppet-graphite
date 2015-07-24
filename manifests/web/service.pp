# Class: graphite::web::service
#
# This is a private class, do not use inside a manifest/role/profile
#
# Parameters:
#
# $web_manage_db_setup:
#   Boolean to see if puppet needs to run the manage.py syncdb command.
#   Default: 'true'
#
# $web_dir:
#  The directory where the graphite-web config is put in.
#  Default: '/etc/graphite-web'
#
# $web_service_name:
#  The name of the web service.
#  Default: 'httpd'
#
# $web_service_enable:
#  The state the service to be in.
#  Default: 'running'
#
# Sample Usage:
#
# contain graphite::web::service
#
# [Remember: No empty lines between comments and class definition]
class graphite::web::service inherits ::graphite::web {

  $managesyncdb_path = "${graphite::web::web_dir}.DoNotDeletePlease"


  if $::operatingsystemmajrelease {
    $os_maj_release = $::operatingsystemmajrelease
  } else {
    $os_versions    = split($::operatingsystemrelease, '[.]')
    $os_maj_release = $os_versions[0]
  }
  case $os_maj_release {
    '7': {
      $pymanagepath = '/usr/lib/python2.7/site-packages/graphite/manage.py'
    }
    default: {
      $pymanagepath = '/usr/lib/python2.6/site-packages/graphite/manage.py'
    }
  }




  if str2bool("${graphite::web::web_manage_db_setup}") {
    exec { 'setup_db':
      command => "/usr/bin/python -W ignore::DeprecationWarning ${pymanagepath} syncdb --noinput",
      creates => $managesyncdb_path,
      before  => Service[$graphite::web::web_service_name],
    }

    file { $managesyncdb_path:
      ensure  => present,
      content => 'This file is a block in puppet for the syncdb command',
      require => Exec['setup_db'],
    }
  }

  service { $graphite::web::web_service_name:
    ensure     => $graphite::web::web_service_enable,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
