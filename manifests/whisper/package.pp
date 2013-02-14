# Class: graphite::whisper::package {
#
class graphite::whisper::package {
  package { 'whisper':
    ensure => present;
  }
}

