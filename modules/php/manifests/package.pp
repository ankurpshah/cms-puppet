class php::package {
  # Define package name
  $php = $operatingsystem ? {
    default => 'php5'
  }
  
  # Package version
  $php_version = $operatingsystem ? {
    default => '5.3.6-13ubuntu3.2'
  }
  
  $php_packages = [
    "${php}-curl", "${php}-dev", "${php}-gd", "${php}-mysql"
  ]

  package { $php_packages:
      ensure => installed
  }
  
  package { ["php-pear", "php5-imagick", "php5-mcrypt"]: 
      ensure => present
  }
}