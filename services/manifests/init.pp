#services init
class services 
{
  file { '/var/www/s3544134':
    ensure => 'directory',
    owner  => 'root',
    mode   => '0644',
  }
}
