# @summary
#   Installs and configures orcus.
#
# @example Install orcus.
#   class { 'orcus':
#     override_config  => {
#       general => {
#         listen_address => '127.0.0.1:3008',
#       }
#     }
#   }
#
# @param package_name
#   Package containing orcus. Defaults to 'orcus'.
# @param version
#   Version of orcus. Defaults to 'latest'.
# @param manage_service
#   Specifies whether orcus service should be managed. Defaults to 'true'.
# @param package_install_options
#   Array of install options for managed package resources. Appropriate options are passed to package manager.
# @param override_config
#   Hash of override configuration options for orcus
#   
class orcus(
  String $package_name                   = $orcus::params::package_name,
  String $version                        = $orcus::params::version,
  Boolean $manage_service                = $orcus::params::manage_service,
  Array[String] $package_install_options = $orcus::params::package_install_options,
  Hash $override_config                  = {}

) inherits orcus::params {

  $config = deep_merge($orcus::params::default_config, $override_config)

  anchor { 'orcus::begin': }
  -> class { 'orcus::install': }
  -> class { 'orcus::config': }
  -> class { 'orcus::service': }
  -> anchor { 'orcus::end': }
}
