class apache::package {
  # Define package name
  $apache = $operatingsystem ? {
    default => 'apache2.2-common'
  }

  package {
    apache:
      ensure => present,
      name => $apache
  }
  
  service { apache:
  	ensure => running,
		require => Package["apache"],
		name => "apache2"
	}
}