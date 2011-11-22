class php::apache::package {
  package { "libapache2-mod-php5":
    ensure => present,
    require => Package[apache],
    notify => Exec[force-reload-apache2]
  }
  
  package { "php-apc": ensure => present }
}