# Class: graphite::whisper::package
#
class graphite::whisper::package {
  $package_name = $::osfamily ? {
    default => 'whisper',
  }

  $package_provider = $::osfamily ? {
    /(?i:Debian)/ => 'pip',
    default       => undef,
  }

  package { $package_name:
    ensure   => present,
    provider => $package_provider,
  }
}

