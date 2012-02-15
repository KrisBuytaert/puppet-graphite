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
class graphite {

  include graphite::carbon
  include graphite::whisper
  include graphite::web

}


class graphite::web {


  package {
    'bitmap-fonts-compat':
      ensure => present;
    'graphite-web':
      ensure => present;
  }



  service { 'httpd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }


}


class graphite::whisper {


  package {'whisper':
    ensure => present;
  }




}



class graphite::carbon {


  package {'carbon':
    ensure => present;
  }





  service { 'carbon':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['carbon'],
  }


}

# needs to move to graphite::demo example and run
# example-client.py from the package


class graphite::demo {


  exec { 'startClientExample':
    command => "bash -c 'python /usr/share/doc/graphite-web-0.9.9/example-client.py >> /var/log/exampleclient.log' disown &",
    require => [ Class['graphite::web'], Class['graphite::carbon'],  Class['graphite::whisper']],
    creates => '/var/log/exampleclient.log'
  }
}


# Implement user creation

#
#
#python manage.py shell
#Python 2.6.5 (r265:79063, Nov 12 2010, 00:52:45)
#[GCC 4.4.4 20100525 (Red Hat 4.4.4-5)] on linux2
#Type "help", "copyright", "credits" or "license" for more information.
#(InteractiveConsole)
#>>> from django.contrib.auth.models import User
#>>> user = User.objects.create_user('root','kris@inuits.eu','graphite')
#>>> user.save()
#>>> quit
#Use quit() or Ctrl-D (i.e. EOF) to exit
#>>>

