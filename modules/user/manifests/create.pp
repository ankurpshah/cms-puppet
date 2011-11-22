define user::create($ensure=present, $uid, $groups, $password='!') {
    $bash = $operatingsystem ?{
        "freebsd" => "/usr/local/bin/bash",
        default => "/bin/bash",
    }
    
    group { $name: ensure => present; }

    if $password == '!' {
        user { $name:
            ensure      => $ensure,
            groups      => $groups,
            uid         => $uid,
            managehome  => true,
            shell       => $bash,
            gid         => $name,
            require	    => Group[$name],
        }
    } else {
        user { $name:
            ensure      => $ensure,
            groups      => $groups,
            uid         => $uid,
            managehome  => true,
            shell       => $bash,
            gid         => $name,
            password    => $password,
            require     => Group[$name],
        }
    }

    file { "/home/${name}":
        ensure  => directory,
        owner   => $name,
        group   => $name,
        mode    => 750,
        require => User[$name],
    }

    file { "/home/${name}/.ssh":
        ensure  => directory,
        owner   => $name,
        group   => $name,
        mode    => 700,
        require => File["/home/${name}"],
    }

    file { "/home/${name}/.ssh/authorized_keys":
        ensure  => present,
        owner   => $name,
        group   => $name,
        mode    => 600,
        require => File["/home/${name}/.ssh"],
    }
}