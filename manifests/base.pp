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

    user::create { "andrei": 
        groups => $user::admin_group,
        uid => 10000,
        require => Class["user"]
    }

    ssh_authorized_key { "andrei":
        ensure  => present,
        require => User['andrei'],
        user    => 'andrei',
        type    => 'rsa',
        key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC+gR9RC5KR5iM5iUp5ebikeGNSzs++8m0aZxfAiP+IMMFGFmUi4eRJLeet6rKxdHW0gM/r2OU9FSCvzbYS7CrBYfB8Tn3H/z1Z3eguGJxycaPJTbrzzXiGqZ6h+xH0cXpgb4Agv/914oBf/bie94kG7O5VKfz8bGTtVhKdqa/yFQ2DnEbhcs3f3zUr5A2taoIQhoV0ezBkAkpVXPAobP776Klp9U1r1YCDBJrdphHJ+vEMiJhVCp+TmUwI9r4oaRz534rdKuVvEAhguRehSGHTw5SX/qrqPPwL6Tg0XueL94J0HWOhvL4Qn973EDHI6csHlXKaX3ASys50bMZk/7IL'
    }

    user::create { "dan": 
        groups => $user::admin_group,
        uid => 10001,
        require => Class["user"]
    }

    ssh_authorized_key { "dan":
        ensure  => present,
        require => User['dan'],
        user    => 'dan',
        type    => 'rsa',
        key     => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAtwzmQHIQTMK1XUjuiwCDzniZKhUtFX9HYON5z8LPOnetO9RA75opsDp0kawVhl+Gp8lg4pZeVL7IYQVp+q1S0PHfEJ/OfFJxHLKSU+DAbrS9rnBjsOQb/+YQr3W/DQzTUFxfUwgTcilkwmnw3Brr9S2mf+5mLgK1IBPmia+M6IM2cV5oedM8EDd4ETLR7vCVrupIjKL79uITPshQHGmOJcFcpGwsMVBOhPEeHM+9ye+j7ATcoLo2a+kKCtvUBJUlJ3xIuIBBv/YJ2uGTAuVvD7w4tTvprv1p5dFnkKwRXpiH/RVquqaofwMwOxNLOGpYBhTIpRWumK18WGIIUzT5KQ=='
    }
}

class { 'base': stage => pre }