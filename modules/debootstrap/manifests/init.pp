define debootstrap::os($arch, $release, $path, $mirror, $variant = 'buildd', $ensure) {
    debootstrap { $name:
        arch => $arch,
        release => $release,
        path => $path,
        mirror => $mirror,
        ensure => $ensure,
        variant => $variant
    }
}