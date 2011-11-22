class mysql::client::package {
  # Define package name
  $mysql = $operatingsystem ? {
    default => 'mysql-client'
  }
  
  # Package version
  $mysql_version = $operatingsystem ? {
    default => '5.1.58-1ubuntu1'
  }

  package {
    mysql:
      ensure => $mysql_version,
      name => $mysql
  }
}