class user {
    $admin_group = 'admin'
    
    group { $admin_group: ensure => present; }
}