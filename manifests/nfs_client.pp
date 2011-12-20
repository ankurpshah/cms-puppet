import "base"

class nfs_client {
  include nfs::client
  
  
  file {"/mnt/nfs":
    ensure => "directory"
  }
  
  nfs::mount {"nfs":
    server     => $nfs_host,
    share      => $nfs_share,
    mountpoint => $nfs_mount_point
  }
}

include nfs_client