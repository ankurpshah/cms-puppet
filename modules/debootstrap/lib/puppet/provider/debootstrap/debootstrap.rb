Puppet::Type.type(:debootstrap).provide(:debootstrap) do
  desc "Manages systems setup via debootstrap"
  
  commands :mount => 'mount', :umount => 'umount', :mkdir => 'mkdir', :rmdir => 'rmdir', :ls => 'ls'
  
  def create
    debootstrap_cmd = ['debootstrap', "--variant=#{@resource[:variant]}", "--arch=#{@resource[:arch]}", @resource[:release], mnt_dir, @resource[:mirror]]
    begin
      execute(debootstrap_cmd)
    rescue
      cleanup_mount
      raise
    end
    cleanup_mount
  end
  
  def exists?
    prepare_mount
    begin
      exists = ls(mnt_dir + "/bin")
    rescue
      exists = false
    end
    cleanup_mount
    
    exists
  end
  
  private
  
  def prepare_mount
    mkdir(mnt_dir)
    mount_target
  end
  
  def cleanup_mount
    umount_target
    rmdir(mnt_dir)
  end
  
  def mnt_dir
    "/mnt/puppet-debootstrap-#{@resource[:name]}"
  end
  
  def mount_target
    mount(@resource[:path], mnt_dir)
  end
  
  def umount_target
    umount(mnt_dir)
  end
end