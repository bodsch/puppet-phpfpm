#
#

class phpfpm::params {

    case $::osfamily {
        'debian': {
            # Module configuration defaults
            $poold_purge = false

            # Service configuration defaults
            $package_name                = 'php5-fpm'
            $service_name                = 'php5-fpm'
            $config_dir                  = '/etc/php5/fpm'
            $config_name                 = 'php-fpm.conf'
            $pool_dir                    = '/etc/php5/fpm/pool.d'
            $pid_file                    = '/var/run/php5-fpm.pid'
            $error_log                   = '/var/log/php-fpm/error.log'
            $syslog_facility             = 'daemon'
            $syslog_ident                = 'php-fpm'
            $log_level                   = 'notice'
            $logdir                      = '/var/log/php-fpm'
            $emergency_restart_threshold = 0
            $emergency_restart_interval  = 0
            $process_control_timeout     = 0
            $process_max                 = 0
            $daemonize                   = 'yes'
            $rlimit_files                = undef
            $rlimit_core                 = undef
            $restart_command             = "service ${service_name} reload"

            # Pool configuration defaults
            $pool_user                    = 'www-data'
            $pool_group                   = 'www-data'
            $pool_listen                  = '127.0.0.1:9000'
            $pool_listen_backlog          = undef
            $pool_listen_owner            = 'www-data'
            $pool_listen_group            = 'www-data'
            $pool_listen_mode             = undef
            $pool_listen_allowed_clients  = undef
            $pool_pm                      = 'dynamic'
            $pool_pm_max_children         = 10
            $pool_pm_start_servers        = 4
            $pool_pm_min_spare_servers    = 2
            $pool_pm_max_spare_servers    = 6
            $pool_pm_process_idle_timeout = undef
            $pool_pm_max_requests         = undef
            $pool_pm_status_path          = '/status'
            $pool_ping_path               = '/ping'
            $pool_ping_response           = 'pong'
            $pool_access_log              = '/var/log/php-fpm/$pool/access.log'
            $pool_access_format           = '"%R - %n - %{HTTP_HOST}e - %u %t \"%m %r [%Q%q]\" %s %f %{mili}d %{kilo}M %C%%"'
            $pool_slowlog                 = 'slow.log'
            $pool_req_slowlog_timeout     = '5s'
            $pool_req_terminate_timeout   = '10s'
            $pool_rlimit_files            = undef
            $pool_rlimit_core             = undef
            $pool_chroot                  = undef
            $pool_chdir                   = '/'
            $pool_catch_workers_output    ='yes'
            $pool_sec_limit_extensions    = undef
            $pool_env                     = {}
            $pool_php_value               = {}
            $pool_php_flag                = {}
            $pool_php_admin_value         = {}
            $pool_php_admin_flag          = {}
        }
        'redhat': {
            # Module configuration defaults
            $poold_purge = false

            # Service configuration defaults
            $package_name                = 'php-fpm'
            $service_name                = 'php-fpm'
            $config_dir                  = '/etc/'
            $config_name                 = 'php-fpm.conf'
            $pool_dir                    = '/etc/php-fpm.d/'
            $pid_file                    = '/var/run/php-fpm/php-fpm.pid'
            $error_log                   = '/var/log/php-fpm/error.log'
            $syslog_facility             = 'daemon'
            $syslog_ident                = 'php-fpm'
            $log_level                   = 'notice'
            $logdir                      = '/var/log/php-fpm'
            $emergency_restart_threshold = 0
            $emergency_restart_interval  = 0
            $process_control_timeout     = 0
            $process_max                 = 0
            $daemonize                   = 'yes'
            $rlimit_files                = undef
            $rlimit_core                 = undef
            $restart_command             = "service ${service_name} reload"

            # Pool configuration defaults
            $pool_user                    = 'apache'
            $pool_group                   = 'apache'
            $pool_listen                  = '127.0.0.1:9000'
            $pool_listen_backlog          = undef
            $pool_listen_owner            = undef
            $pool_listen_group            = undef
            $pool_listen_mode             = undef
            $pool_listen_allowed_clients  = undef
            $pool_pm                      = 'dynamic'
            $pool_pm_max_children         = 10
            $pool_pm_start_servers        = 4
            $pool_pm_min_spare_servers    = 2
            $pool_pm_max_spare_servers    = 6
            $pool_pm_process_idle_timeout = undef
            $pool_pm_max_requests         = undef
            $pool_pm_status_path          = undef
            $pool_ping_path               = undef
            $pool_ping_response           = undef
            $pool_access_log              = undef
            $pool_access_format           = undef
            $pool_slowlog                 = undef
            $pool_req_slowlog_timeout     = undef
            $pool_req_terminate_timeout   = undef
            $pool_rlimit_files            = undef
            $pool_rlimit_core             = undef
            $pool_chroot                  = undef
            $pool_chdir                   = '/'
            $pool_catch_workers_output    = undef
            $pool_sec_limit_extensions    = undef
            $pool_env                     = {}
            $pool_php_value               = {}
            $pool_php_flag                = {}
            $pool_php_admin_value         = {}
            $pool_php_admin_flag          = {}
        }
        default: {
            fail( "Unsupported platform: ${::osfamily}" )
        }
    }
}

# EOF