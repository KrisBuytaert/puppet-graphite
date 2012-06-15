# = Class: graphite::whisper
#
# Description of graphite::whisper
#
# == Actions:
#
# Installs the whisper package.
#
# == Todo:
#
# * Update documentation
#
class graphite::whisper {

  include graphite::whisper::package
  include graphite::whisper::config

}

