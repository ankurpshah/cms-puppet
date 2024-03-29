import "base"

class web {
    package {"capistrano":
        ensure   => "2.8.0",
        provider => "gem"
    }
    
    package {"capistrano-ext":
        ensure   => present,
        provider => "gem"
    }

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
        command => "wget -O- $puppet_tarball | tar --strip-components=1 -xzC /etc/puppet/ && puppet apply --verbose --logdest syslog /etc/puppet/manifests/web.pp",
        user    => "root",
        hour    => "*",
        minute  => "30"
    }
}

include web