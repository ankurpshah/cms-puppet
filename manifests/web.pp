class web {
  Exec {
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
  }

  exec { "apt-update":
    command => "apt-get -q update"
  }

  Exec["apt-update"] -> Package <| |>

  include git
  
  include apache
  apache::module {"rewrite": ensure => present }
  
  include mysql::client
  include php
  include php::apache
  
  include phing
}

include web