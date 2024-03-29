class php::apache::package {
  package { "libapache2-mod-php5":
    ensure => present,
    require => Package[apache],
    notify => Service[apache]
  }
  
  package { "php-apc": ensure => present }
}