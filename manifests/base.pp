import "stage"

Exec {
   path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
}

class base {
    # Install basic things in pre
    class { 'user': stage => pre }
    class { 'sudo': stage => pre }
    class { 'git':  stage => pre }

    include sudo
    include user
    include git
    
    import "user"
}

class { 'base': stage => pre }