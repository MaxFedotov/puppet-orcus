# @summary 
#   Private class for installing orcus.
#
# @api private
#
class orcus::install {

  package { $orcus::package_name:
    ensure          => $orcus::version,
    install_options => $orcus::package_install_options,
  }

}
