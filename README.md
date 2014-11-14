# phpfpm

#### Table of Contents



## Overview

This module manages the php-fpm daemon and pools only.

Managing php, php extensions, pear, pecl, nginx, apache, etc are out of the scope of this module.


## Examples

Simply include the module and it will install the Icinga instance.

```puppet
include '::phpfpm'
```

Complex:

```puppet
  class {
    '::phpfpm':
      log_level   => 'notice',
      error_log   => '/var/log/php-fpm/error.log',
      emergency_restart_threshold => 10,
      emergency_restart_interval  => 60,
      process_control_timeout     => '10s',
      process_max                 => 128
  }
```

Create an simple set on different workers:

```puppet
  $PHPFlag = {
    'display_errors'        => 'off'
  }

  $PHPAdminFlag = {
    'expose_php'            => 'off',
  }

  $PHPAdminValue = {
    'upload_max_filesize'   => '8M',
    'max_execution_time'    => '300',
    'log_errors'            => 'on',
    'date.timezone'         => '"Europe/Berlin"',
    'memory_limit'          => '256M',
    'error_log'             => '/var/log/php-fpm/$pool/error.log',
    'session.save_handler'  => 'memcache',
    'session.save_path'     => '"tcp://127.0.0.1:11211"',
  }

  $listen_sock = '/var/run/php5-fpm-$pool.sock'

  ::phpfpm::worker {[
      'worker-0',
      'worker-1',
      'worker-2']:
        php_flag        => $PHPFlag,
        php_admin_flag  => $PHPAdminFlag,
        php_admin_value => $PHPAdminValue
    }
```


## Reference

## Limitations

This module has been built on and tested against Puppet 2.7

The module has been tested on:

* Debian 6
* Debian 7
* Ubuntu 12
* Ubuntu 14

Testing on other platforms has been light and cannot be guaranteed.


