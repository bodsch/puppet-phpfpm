#
#

define phpfpm::worker(
  $php_flag,
  $php_admin_flag,
  $php_admin_value
) {

  file {
    "/var/log/php-fpm/${title}":
      ensure => directory
  }

  $listen_sock = '/var/run/php5-fpm-$pool.sock'

  phpfpm::pool {
    $title:
      listen          => $listen_sock,
      php_flag        => $PHPFlag,
      php_admin_flag  => $PHPAdminFlag,
      php_admin_value => $PHPAdminValue
  }

}

# EOF
