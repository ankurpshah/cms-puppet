These are the necessary Puppet recipes for setting up the CMS stack.

When cloudformation starts new servers, it passes a bash script through userdata that gets puppet onto the server and runs it. Puppet sets up Apache, php and everything else that's needed.

The base of the script that runs Puppet is:

apt-get update && apt-get install -y puppet rubygems
mkdir -p /etc/puppet && wget -O- https://github.com/HouseTrip/cms-puppet/tarball/master | tar --strip-components=1 -xzC /etc/puppet/
puppet apply --logdest syslog /etc/puppet/manifests/web.pp