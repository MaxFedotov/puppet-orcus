# @summary 
#   Private class for managing orcus config.
#
# @api private
#
class orcus::config {
  $config = $orcus::config

  file { '/etc/orcus.cnf':
    ensure  => file,
    content => orcus_config($config),
    owner   => 'orcus',
    group   => 'orcus',
    mode    => '0664',
  }

}
