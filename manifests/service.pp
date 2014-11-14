#
#

class phpfpm::service (
    $restart_command = $phpfpm::params::restart_command,
    $service_name    = $phpfpm::params::service_name,
) inherits phpfpm::params {

  # Manage service and configuration only if the package is present
  if( $phpfpm::ensure != 'absent' ) {

    # Manage daemon
    class {
      'phpfpm::service':
        service_name    => $service_name,
        restart_command => $restart_command,
        require         => Class['phpfpm::package'],
    }

    file {
      $phpfpm::pool_dir:
        ensure => 'directory',
    }

    # Purge pool.d if necessary
    if( $phpfpm::poold_purge == true ) {
      File[$phpfpm::pool_dir] {
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
  } else {

    service {
      $service_name:
        ensure     => 'running',
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
        restart    => $restart_command,
    }
  }

}

# EOF
