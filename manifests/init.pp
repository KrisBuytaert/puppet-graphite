# = Class: graphite
#
# This module manages graphite
#
# == Sample Usage:
#
#   include graphite
#
# == Todo:
#
# * Implement user creation.
#
class graphite {
  class { 'graphite::carbon': }
  class { 'graphite::carbon_cache': }
  class { 'graphite::carbon_aggregator': }
  class { 'graphite::whisper': }
  class { 'graphite::web': }

  Class['graphite::carbon', 'graphite::whisper'] -> Class['graphite::carbon_cache', 'graphite::carbon_aggregator'] -> Class['::graphite::web']

  graphite::carbon_cache::storage_schema { 'stats':
    pattern    => '^stats.*',
    retentions => '10:2160,60:10080,600:262974',
  }

  graphite::carbon_cache::storage_schema { 'carbon':
    pattern    => '^carbon\.',
    retentions => '60:90d',
  }

  graphite::carbon_cache::storage_schema { 'everything_hourly_3yrs':
    pattern    => '.*hourly.*',
    retentions => '3600:26280',
  }

  graphite::carbon_cache::storage_schema { 'everything_daily_10yrs':
    pattern    => '.*daily.*',
    retentions => '86400:3650',
  }

  graphite::carbon_cache::storage_schema { 'events_min_30days_15min_3yrs':
    pattern    => '^events\.',
    retentions => '60:43200,900:105120',
  }

  graphite::carbon_cache::storage_schema { 'everything_1min_7day':
    pattern    => '.*',
    retentions => '60:10080',
  }

  graphite::carbon_cache::storage_aggregation { 'min':
    pattern           => '\.min$',
    xfilesfactor      => '0.1',
    aggregationmethod => 'min',
  }

  graphite::carbon_cache::storage_aggregation { 'max':
    pattern           => '\.max$',
    xfilesfactor      => '0.1',
    aggregationmethod => 'max',
  }

  graphite::carbon_cache::storage_aggregation { 'sum':
    pattern           => '\.count$',
    xfilesfactor      => '0',
    aggregationmethod => 'sum',
  }

  graphite::carbon_cache::storage_aggregation { 'default_average':
    pattern           => '.*',
    xfilesfactor      => '0.3',
    aggregationmethod => 'average',
  }

}

