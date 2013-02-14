# Class: graphite::whisper::package
#
class graphite::whisper::package {
  $package_name = $::osfamily ? {
    /(?i:Debian)/ => 'python-whisper',
    /(?i:RedHat)/ => 'whisper',
    default       => 'whisper',
  }

  package { $package_name:
    ensure => present;
  }
}

