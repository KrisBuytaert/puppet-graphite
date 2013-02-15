# = Class: graphite::web
#
# Installs the graphite webfontend.
#
# == Actions:
#
# Installs packages for graphite web frontend.
#
# == Requires:
#
# Running web server.
#
# == Todo:
#
# * Update documentation
#
class graphite::web (
  $manage_httpd = $::graphite::params::manage_httpd,
) {
  require graphite::params
  include graphite::web::package
  include graphite::web::config

  if $manage_httpd {
    include graphite::web::service
  }
}

