# == Class: graphite::demo
#
# Setup client example.
#
class graphite::demo {
  exec { 'startClientExample':
    command => "bash -c 'python /usr/share/doc/graphite-web-0.9.9/example-client.py >> /var/log/exampleclient.log' disown &",
    creates => '/var/log/exampleclient.log',
    require => [
      Class['graphite::web'],
      Class['graphite::carbon'],
      Class['graphite::whisper'],
    ],
  }
}

