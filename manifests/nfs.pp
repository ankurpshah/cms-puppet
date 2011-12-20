import "base"

class nfs {
  import "lvm"
  include nfs::server
  
  lvm::volume {"nfs":
      ensure => present,
      vg => 'nfs-vg',
      pv => '/dev/xvdf',
      fstype => 'ext4',
      size => '10G',
      require => Package["lvm2"]
  }
  
  file {"/mnt/nfs":
    ensure => "directory"
  }
  
  mount {"nfs":
    ensure  => "mounted",
    device  => "/dev/nfs-vg/nfs",
    fstype  => "ext4",
    name    => "/mnt/nfs",
    require => [File["/mnt/nfs"], Lvm::Volume["nfs"]],
    options => "noatime"
  }
  
  nfs::export {"assets": 
    share   => "/mnt/nfs",
    guest   => "*",
    options => "rw,no_root_squash,async",
    require => Mount["nfs"]
  }
}

include nfs