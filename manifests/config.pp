#
#

class phpfpm::config inherits phpfpm::params {

  file {
    $logdir:
      ensure    => directory
  }

}

# EOF
