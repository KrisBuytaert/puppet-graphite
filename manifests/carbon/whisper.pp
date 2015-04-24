#
#
#
class graphite::whisper (
) inherits graphite::carbon {
  package { $whisper_package :
    ensure => $whisper_package_ensure,
  }
}
