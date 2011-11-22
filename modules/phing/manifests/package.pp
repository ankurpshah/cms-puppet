class phing::package {
  require php
  
  exec { 'pear config-set auto_discover 1':; }
  
  exec {
    'pear install Archive_Tar-1.3.8':
      unless => 'pear list -a | grep Archive_Tar';
    'pear install Console_Getopt-1.3.1':
      unless => 'pear list -a | grep Console_Getopt';
    'pear install Crypt_HMAC2-1.0.0':
      unless => 'pear list -a | grep Crypt_HMAC2';
    'pear install HTTP_Request2-2.0.0':
      unless => 'pear list -a | grep HTTP_Request2';
    'pear install Net_URL2-2.0.0':
      unless => 'pear list -a | grep Net_URL2';
    'pear install Services_Amazon_S3-0.3.5':
      unless => 'pear list -a | grep Services_Amazon_S3';
    'pear install Structures_Graph-1.0.4':
      unless => 'pear list -a | grep Structures_Graph';
    'pear install XML_Util-1.2.1':
      unless => 'pear list -a | grep XML_Util';  
    'pear install pear.phing.info/phing':
      unless => 'pear list -a | grep phing';
  }
}