class pe_quickstart_app {
/*    
   class { 'apache':
     mpm_module => 'prefork',
   }      
 
*/
   include apache::mod::php
 
   apache::vhost { 'pe_quickstart_app':
     port     => '80',
     docroot  => '/var/www/pe_quickstart_app',
     priority => '10',
   }
 
   file { '/var/www/pe_quickstart_app/index.php':
     ensure  => file,
     content => "THIS APP IS MANAGED BY PUPPET\n<?php phpinfo() ?>\n",
     mode    => '0644',
   }
      
 }
