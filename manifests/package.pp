#
#

class phpfpm::package (
  $ensure       = 'present'
) inherits phpfpm::params {

  package {
    $phpfpm::params::package_name:
      ensure => $ensure,
  }

  package {
    $phpfpm::params::package_memcached:
      ensure => $ensure,
  }

}

# EOF
