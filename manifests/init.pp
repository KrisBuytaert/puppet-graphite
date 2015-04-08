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
class graphite inherits graphite::params{

  include graphite::params
  include graphite::carbon
  include graphite::whisper
  include graphite::web

}

