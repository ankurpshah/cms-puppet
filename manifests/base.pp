import "stage"

Exec {
   path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
}

class base {
    # Install langauge pack
    package { "language-pack-en": ensure => present }
    
    # Install basic things in pre
    class { 'user': stage => pre }
    class { 'sudo': stage => pre }
    class { 'git':  stage => pre }

    include sudo
    include user
    include git

    user::create { "andrei": 
        groups => "andrei",
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
        require => Class["user"]
    }

    ssh_authorized_key { "dan":
        ensure  => present,
        require => User['dan'],
        user    => 'dan',
        type    => 'rsa',
        key     => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAtwzmQHIQTMK1XUjuiwCDzniZKhUtFX9HYON5z8LPOnetO9RA75opsDp0kawVhl+Gp8lg4pZeVL7IYQVp+q1S0PHfEJ/OfFJxHLKSU+DAbrS9rnBjsOQb/+YQr3W/DQzTUFxfUwgTcilkwmnw3Brr9S2mf+5mLgK1IBPmia+M6IM2cV5oedM8EDd4ETLR7vCVrupIjKL79uITPshQHGmOJcFcpGwsMVBOhPEeHM+9ye+j7ATcoLo2a+kKCtvUBJUlJ3xIuIBBv/YJ2uGTAuVvD7w4tTvprv1p5dFnkKwRXpiH/RVquqaofwMwOxNLOGpYBhTIpRWumK18WGIIUzT5KQ=='
    }
    
    user::create { "mmitchell": 
        groups => $user::admin_group,
        require => Class["user"]
    }

    ssh_authorized_key { "mmitchell":
        ensure  => present,
        require => User['mmitchell'],
        user    => 'mmitchell',
        type    => 'rsa',
        key     => 'AAAAB3NzaC1kc3MAAACBAO38xrFyiqY3DS+c2MS/eN5LOH3V6huEShKC7L8/MFqMIP2dNf0hV90KIO/ij9kT0HVDF2p2MM/zgb9+I+f7JX7TyaPwbGU63Z3b66wcQd+wVYwGSnfnmfAbUVdd8Z0shfjShxJbk6G17PDK+oNvybT07PSXiOLdSgYWCjdog9VrAAAAFQCvVRFU8hMNf2ZZZuDrRHK72pKZ0QAAAIBvOVo6EZJJOoMod3WR+UH7ipJuii2HYpOXcryyCf6NaNq6J+QM5M/R5Y/jc5vfL2WuJxmqTJjQPBRpwJh+r3zHgS+qIFNlTWIjMiq9BRYUzvW6n3ai9uGFTtWS6djQVyaomTcQBq2wPDkt9Q4m6g4K8cZuopThcUcqecWboZ6SBgAAAIBQQ0EVnD8VqB0+Dd6O8tWntlWqG68PzP7WiKkfpgCFyvqObT7ow4Z7V0kj3cyoJiO4vodyQQSH2IHqvG643urYuh4PdTzlt9Lm2SOkHvNe0o3wIpBNhNuKk85x9wXQWVxzhTjrXtL6/zYYnlYO8s4hwQw274CYnSWXbNFu2crtRQ== marcusmitchell@marcus-macbook.local'
    }

    user::create { "simon": 
        groups => $user::admin_group,
        require => Class["user"]
    }

    ssh_authorized_key { "simon":
        ensure  => present,
        require => User['simon'],
        user    => 'dan',
        type    => 'rsa',
        key     => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA3mVClJPe8kuUUCyF9eBm1w6TLF2HukRzDsHM6Q0n2zZXDfICg0Fsk0nKvKhc9rLSIj5WdN2vSLa9tvmt5cDW7Nhp8Rp7/mhFKX29IXzaYTDxbwiXEss1CGiYGDJtcF0+lgKex/jju2ScvhEGb8iXRAkFdh3L+FW/2yqHNVpBoWYYVtYA/s2kWAqQNIr+0s/Je+dwcBuI6YUPlgRhPyJ1RzV9w7OguOf35OlP7UjddWsx+PtzJyfpah3uBkF0GcY1JeOZYNI/3R1nw9m1xMaBgSnCkc0J+BVLKZ4d6gJYUCirqCv8qfzR6kuOLMbLLA+ihJVknPk/hRsVAQpc4g0SkQ=='
    }
}

class { 'base': stage => pre }

include base