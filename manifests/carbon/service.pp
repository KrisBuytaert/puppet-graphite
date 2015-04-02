class graphite::carbon::service inherits graphite::carbon {

  service { 'carbon-cache':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}
