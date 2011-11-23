class apache::package {
    # Define package name
    $apache = $operatingsystem ? {
        default => 'apache2.2-common'
    }

    package {
        apache:
            ensure => present,
            name => $apache
    }

    service { apache:
        ensure => running,
        require => Package["apache"],
        name => "apache2",
        subscribe => Package["apache"]
    }

    # make sure the default site isn't present.
    exec { "/usr/sbin/a2dissite default":
        onlyif => "/usr/bin/test -L /etc/apache2/sites-enabled/000-default",
        notify => Service["apache"],
        require => Package["apache"]
    }
    
    file { "/etc/apache2/apache2.conf":
        ensure  => present,
        source  => "puppet:///modules/apache/apache2.conf",
        owner   => 'root',
        group   => 'root',
        mode    => '0664',
        require => Package["apache"],
        notify  => Service["apache"]
    }
    
    file { "/etc/apache2/ports.conf":
        ensure  => present,
        source  => "puppet:///modules/apache/ports.conf",
        owner   => 'root',
        group   => 'root',
        mode    => '0664',
        require => Package["apache"],
        notify  => Service["apache"]
    }
}