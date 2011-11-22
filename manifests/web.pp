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
    
    cron { "puppet":
        command => "puppet apply --logdest syslog /etc/puppet/manifests/web.pp",
        user    => "root",
        hour    => "*",
        minute  => "30"
    }
}

include web