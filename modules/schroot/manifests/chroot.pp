define schroot::chroot($groups="root",
                      $root_groups="root", 
                      $source_groups="root", 
                      $source_root_groups="root", 
                      $aliases = "default", 
                      $description = "", 
                      $lvm_snapshot_options = "--size 5G", 
                      $type = "directory",
                      $device = "") {
  file {"/etc/schroot/chroot.d/$name.conf":
    content => template('schroot/chroot.erb')
  }
}