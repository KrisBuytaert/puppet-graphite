class graphite::carbon::service inherits graphite::carbon {

  service { $carbon_cache_service_name:
    ensure     => $carbon_cache_service_ensure,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}
