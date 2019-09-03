# @summary
#   Private class for setting default orcus parameters.
#
# @api private
#
class orcus::params {
  $package_name            = 'orcus'
  $version                 = 'latest'
  $manage_service          = true
  $user                    = 'orcus'
  $group                   = 'orcus'
  $package_install_options = []
  $default_config = {
    general      => {
      listen_address  => '127.0.0.1:3008',
      log_file        => '/var/log/orcus/orcus.log',
      log_level       => 'info',
      sync_interval   => '10m',
      ssl_skip_verify => true,
      http_timeout    => '5s',
      threads         => 5,
      cache_ttl       => '24h'
    },
    orchestrator => {
      url                      => 'http://localhost:3000',
      force_sync_delay         => '5s',
      submit_masters_to_consul => true,
    },
    consul       => {
      address        => '127.0.0.1:8500',
      acl_token      => '',
      kv_prefix      => 'db/mysql',
      lock_ttl       => '1m',
      retry_interval => '5s',
    }
  }
}
