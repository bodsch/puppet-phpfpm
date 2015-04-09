#
#
#
#

class phpfpm::install {

  include phpfpm::params

  package {
    $phpfpm::params::package_name:
      ensure => $phpfpm::ensure
  }

  package {
    $phpfpm::params::package_memcached:
      ensure => $phpfpm::ensure
  }

#   class {
#     'phpfpm::package':
#       ensure       => $phpfpm::ensure
#   }

}

# EOF
