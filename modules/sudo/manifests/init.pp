class sudo {
    file { '/etc/sudoers':
        source => 'puppet:///modules/sudo/sudoers',
        mode   => '0440',
        owner  => 'root',
        group  => 'root'
    }
}