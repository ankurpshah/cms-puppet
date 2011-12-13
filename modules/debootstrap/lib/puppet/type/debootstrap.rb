Puppet::Type.newtype(:debootstrap) do
  desc "Create an operating system."

  ensurable
  
  newparam(:variant) do
    desc "The debootstrap variant"
    
    validate do |value|
      unless %w(buildd).include? value
        raise ArgumentError, "%s is not a valid variant" % value
      end
    end
  end
  
  newparam(:name) do
    isnamevar
  end
  
  newparam(:arch) do
    desc "The os arch"
    
    validate do |value|
      unless %w(i386 amd64).include? value
        raise ArgumentError, "%s is not a valid arch" % value
      end
    end
  end
  
  newparam(:release) do
    desc "The os release (e.g. oneiric)"
  end
  
  newparam(:path) do
    desc "Where to setup the os"
  end
  
  newparam(:mirror) do
    desc "Mirror to use for packages"
  end
end