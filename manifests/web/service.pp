class graphite::web::service {

  $manualbdsetup = 'false'
  $managesyncdb_path = "${graphite_web_config_dir}.DoNotDeletePlease"

  if !${manualdbsetup} {
   exec { 'setup db':
     command  => '/usr/bin/python /usr/lib/python2.6/site-packages/graphite/manage.py syncdb --noinput',
     creates  => ${mangesyncdb_path},
 }

    file { ${managesyncdb_path}:
      ensure  => present,
      content => 'This file is a block in puppet for the syncdb command'
    }
  }

  service { 'httpd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }


}
