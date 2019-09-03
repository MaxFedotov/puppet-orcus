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
    owner   => $orcus::user,
    group   => $orcus::group,
    mode    => '0664',
  }

  file { '/var/log/orcus':
    ensure => directory,
    owner  => $orcus::user,
    group  => $orcus::group,
    mode   => '2644'
  }

}
