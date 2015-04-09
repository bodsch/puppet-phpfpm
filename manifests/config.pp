#
#

class phpfpm::config {

  include phpfpm::params

  if( $phpfpm::ensure != 'absent' ) {

    file {
      "${phpfpm::logdir}":
        ensure    => directory
    }

    file {
      "${phpfpm::pool_dir}":
        ensure => 'directory',
    }

    # Purge pool.d if necessary
    if( $phpfpm::poold_purge == true ) {
      File[ $phpfpm::pool_dir ] {
        purge   => true,
        recurse => true,
      }
    }

    # Main php-fpm config file
    file {
      "${phpfpm::config_dir}/${phpfpm::config_name}":
        ensure  => 'present',
        content => template('phpfpm/php-fpm.conf.erb'),
        notify  => Class['phpfpm::service'],
    }
  }
  
}

# EOF
