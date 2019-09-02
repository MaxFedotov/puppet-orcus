# @summary 
#   Private class for managing orcus service.
#
# @api private
#
class orcus::service {
  if $orcus::manage_service {
    service { 'orcus':
      ensure    => 'running',
      enable    => true,
      subscribe => File['/etc/orcus.cnf'],
    }
  }
}
