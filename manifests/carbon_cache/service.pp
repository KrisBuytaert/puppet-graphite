class graphite::carbon_cache::service {
  service { 'carbon-cache':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['carbon'],
  }
}

