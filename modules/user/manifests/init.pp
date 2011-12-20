class user {
    $admin_group = ['admin', 'sudo']
    
    group { $admin_group: ensure => present; }
}