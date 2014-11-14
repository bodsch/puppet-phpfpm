#
#

class phpfpm::package (
  $ensure       = 'present',
  $package_name = $phpfpm::params::package_name,
) inherits phpfpm::params {

  package {
    $package_name:
      ensure => $ensure,
  }

  package {
    'php5-memcache':
      ensure => $ensure,
  }

}

# EOF
