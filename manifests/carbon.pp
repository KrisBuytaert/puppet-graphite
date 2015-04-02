# = Class: graphite::carbon
#
# Install carbon and enable carbon.
#
# == Actions:
#
# Installs the carbon package and enables the carbon service.
#
# == Todo:
#
# * Update documentation
#
class graphite::carbon inherits graphite::params {

  contain graphite::carbon::package
  contain graphite::carbon::config
  contain graphite::carbon::service

}
