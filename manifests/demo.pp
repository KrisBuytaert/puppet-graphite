# = Class: graphite::demo
#
# Setup client example.
#
# == Actions:
#
# Describe what this class does. What gets configured and how.
#
# == Requires:
#
# Requirements. This could be packages that should be made available.
#
# == Sample Usage:
#
# == Todo:
#
# * Update documentation
#
class graphite::demo {

  exec { 'startClientExample':
    command => "bash -c 'python /usr/share/doc/graphite-web-0.9.9/example-client.py >> /var/log/exampleclient.log' disown &",
    require => [
      Class['graphite::web'],
      Class['graphite::carbon'],
      Class['graphite::whisper'],
    ],
    creates => '/var/log/exampleclient.log'
  }

}

