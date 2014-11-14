#
#
#
#

class phpfpm::install {

  class {
    'phpfpm::package':
      ensure       => $phpfpm::ensure,
      package_name => $phpfpm::package_name,
  }
}

# EOF
