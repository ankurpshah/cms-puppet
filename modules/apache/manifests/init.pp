class apache {
	include apache::package
	
	# Notify this when apache needs a reload. This is only needed when
	#sites are added or removed, since a full restart then would be
	# a waste of time. When the module-config changes, a force-reload is
	# needed.
	exec { "reload-apache":
		refreshonly => true
	}

	exec { "force-reload-apache":
		refreshonly => true
	}
	
	define module ( $ensure = 'present', $require_package = 'apache' ) {
  	case $ensure {
  		'present' : {
  			exec { "/usr/sbin/a2enmod $name":
  				unless => "/bin/sh -c '[ -L /etc/apache2/mods-enabled/${name}.load ] \\
  					&& [ /etc/apache2/mods-enabled/${name}.load -ef /etc/apache2/mods-available/${name}.load ]'",
  				notify => Exec["force-reload-apache"],
  				require => Package[$require_package],
  			}
  		}
  		'absent': {
  			exec { "/usr/sbin/a2dismod $name":
  				onlyif => "/bin/sh -c '[ -L /etc/apache2/mods-enabled/${name}.load ] \\
  					&& [ /etc/apache2/mods-enabled/${name}.load -ef /etc/apache2/mods-available/${name}.load ]'",
  				notify => Exec["force-reload-apache"],
  				require => Package["apache"],
  			}
  		}
  	}
  }
}