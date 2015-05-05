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

  if str2bool("${graphite::web::web_manage_db_setup}") {
    exec { 'setup_db':
      command => '/usr/bin/python /usr/lib/python2.6/site-packages/graphite/manage.py syncdb --noinput',
      creates => $managesyncdb_path,
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
