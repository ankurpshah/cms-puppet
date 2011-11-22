user::create { "andrei": 
    groups => $user::admin_group,
    uid => 10000
}

ssh_authorized_key { "andrei":
    ensure  => present,
    require => User['andrei'],
    user    => 'andrei',
    type    => 'rsa',
    key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC+gR9RC5KR5iM5iUp5ebikeGNSzs++8m0aZxfAiP+IMMFGFmUi4eRJLeet6rKxdHW0gM/r2OU9FSCvzbYS7CrBYfB8Tn3H/z1Z3eguGJxycaPJTbrzzXiGqZ6h+xH0cXpgb4Agv/914oBf/bie94kG7O5VKfz8bGTtVhKdqa/yFQ2DnEbhcs3f3zUr5A2taoIQhoV0ezBkAkpVXPAobP776Klp9U1r1YCDBJrdphHJ+vEMiJhVCp+TmUwI9r4oaRz534rdKuVvEAhguRehSGHTw5SX/qrqPPwL6Tg0XueL94J0HWOhvL4Qn973EDHI6csHlXKaX3ASys50bMZk/7IL'
}