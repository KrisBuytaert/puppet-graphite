# Class: graphite::carbon
#
# This class manages the configuration of the relay.
# It inherists params from the params class.
# This class setups the relay on the node as standalone or in combination with carbon-caches.
# The config of the relay is done by concatination a part of config to the carbon.conf.
#
# Parameters:
#
# The same as in the carbon.conf file but in lower case and with a prefix corresponding to the config section.
# Example:
#   In carbon.conf:
#   "REPLICATION_FACTOR = 1"
#   In the puppet class definition:
#   "relay_replication_factor => '1',"
#
# Sample uses:
#
class graphite::relay (
) {

}
