# Run ssh and set config file

class openssh
{
  file { '/etc/ssh/sshd_config':
    ensure  => present,
    mode    => '0777',
    owner   => 'root',
    group   => 'root',
    source  => '/etc/puppetlabs/code/environments/production/manifests/configfiles/sshd_config',
    require => Package['openssh-server'],
  }
  
  -> service { 'sshd' :
    ensure    => running,
    enable    => true,
    require   => Package['openssh-server'],
    subscribe => File['/etc/ssh/sshd_config'],
  }
}
