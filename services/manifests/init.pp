#services init
class services 
{
  file { '/var/www/s3544134':
    ensure => 'directory',
    owner  => 'root',
    mode   => '0644',
  }
  
  #set apache conf file
  file { 
    '/etc/httpd/conf/httpd.conf' :
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => '/etc/puppetlabs/code/environments/production/manifests/configfiles/httpd.conf',
    require => Package['httpd'],
  }
  
  #subscribe to apache
  -> service 
  { 
    'httpd' :
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/httpd/conf/httpd.conf'],
  }
}
