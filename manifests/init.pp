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
class graphite{

  include graphite::carbon
  include graphite::whisper
  include graphite::web

}

