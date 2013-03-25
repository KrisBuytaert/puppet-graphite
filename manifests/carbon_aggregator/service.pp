class graphite::carbon_aggregator::service {

  service { 'carbon-aggregator':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['carbon'],
  }

}

