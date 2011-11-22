import "base"

class web {  
    include apache
    apache::module {"rewrite": ensure => present }
    
    user { "www-data":
        groups => "admin"
    }
  
    include mysql::client
    include php
    include php::apache

    include phing
}

include web