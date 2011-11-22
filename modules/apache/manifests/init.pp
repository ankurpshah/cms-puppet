class apache {
	include apache::package
	
	define module ( $ensure = 'present', $require_package = 'apache' ) {
	  	case $ensure {
	  		'present' : {
	  			exec { "/usr/sbin/a2enmod $name":
	  				unless => "/bin/sh -c '[ -L /etc/apache2/mods-enabled/${name}.load ] \\
	  					&& [ /etc/apache2/mods-enabled/${name}.load -ef /etc/apache2/mods-available/${name}.load ]'",
	  				notify => Service["apache"],
	  				require => Package[$require_package],
	  			}
	  		}
	  		'absent': {
	  			exec { "/usr/sbin/a2dismod $name":
	  				onlyif => "/bin/sh -c '[ -L /etc/apache2/mods-enabled/${name}.load ] \\
	  					&& [ /etc/apache2/mods-enabled/${name}.load -ef /etc/apache2/mods-available/${name}.load ]'",
	  				notify => Service["apache"],
	  				require => Package["apache"]
	  			}
	  		}
	  	}
	}
	
	define site ( $ensure = 'present', $require_package = 'apache') {
		case $ensure {
			'present' : {
				exec { "/usr/sbin/a2ensite $name":
	  				unless => "/bin/sh -c '[ -L /etc/apache2/sites-enabled/${name} ] \\
	  					&& [ /etc/apache2/sites-enabled/${name} -ef /etc/apache2/sites-available/${name} ]'",
	  				notify => Service["apache"],
	  				require => Package[$require_package],
	  			}
			}
			'absent' : {
				exec { "/usr/sbin/a2dissite $name":
	  				onlyif => "/bin/sh -c '[ -L /etc/apache2/sites-enabled/${name} ] \\
	  					&& [ /etc/apache2/sites-enabled/${name} -ef /etc/apache2/sites-available/${name} ]'",
	  				notify => Service["apache"],
	  				require => Package["apache"]
	  			}
			}
		}
	}
	
	file { "/var/www/vhosts" :
	    owner   => 'root',
	    group   => 'admin',
	    ensure  => 'directory',
	    mode    => '2775',
	    require => Package['apache']
	}
}