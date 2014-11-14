#
#

class phpfpm (
    $ensure                      = 'present',
    $poold_purge                 = $phpfpm::params::poold_purge,
    $package_name                = $phpfpm::params::package_name,
    $service_name                = $phpfpm::params::service_name,
    $config_dir                  = $phpfpm::params::config_dir,
    $config_name                 = $phpfpm::params::config_name,
    $pool_dir                    = $phpfpm::params::pool_dir,
    $pid_file                    = $phpfpm::params::pid_file,
    $error_log                   = $phpfpm::params::error_log,
    $syslog_facility             = $phpfpm::params::syslog_facility,
    $syslog_ident                = $phpfpm::params::syslog_ident,
    $log_level                   = $phpfpm::params::log_level,
    $emergency_restart_threshold = $phpfpm::params::emergency_restart_threshold,
    $emergency_restart_interval  = $phpfpm::params::emergency_restart_interval,
    $process_control_timeout     = $phpfpm::params::process_control_timeout,
    $process_max                 = $phpfpm::params::process_max,
    $daemonize                   = $phpfpm::params::daemonize,
    $rlimit_files                = $phpfpm::params::rlimit_files,
    $rlimit_core                 = $phpfpm::params::rlimit_core,
    $restart_command             = $phpfpm::params::restart_command,
) inherits phpfpm::params {

  class { 'phpfpm::install': } ->
  class { 'phpfpm::config': } ~>
  class { 'phpfpm::service': } ->
  Class['phpfpm']

}



# EOF
