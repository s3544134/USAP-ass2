#Create users

class user
{
  #requiring groups and packages init.pp files
  require packages
  require groups
  
  user { 'becca':
		ensure => 'present',
		uid => '10014134',
		home => '/home/becca',
		managehome => true,
		groups => [ 'sysadmin', 'cars' ]
		password => pw_hash('password', 'SHA-1'),
		shell => '/bin/bash',
	}
	
	user { 'fred':
		ensure => 'present',
		uid => '10024134',
		home => '/home/fred',
		managehome => true,
		groups => [ 'trucks', 'cars', 'sudo' ]
		password => pw_hash('password', 'SHA-1'),
		shell => '/bin/csh',
	}
	
	user { 'wilma':
		ensure => 'present',
		uid => '10034134',
		home => '/home/wilma',
		managehome => true,
		groups => [ 'trucks', 'cars', 'ambulances' ]
		password => pw_hash('password', 'SHA-1'),
    purge_ssh_keys => true,
	}
  
  #set Wilma SSH key
  -> ssh_authorized_key { 'wilmasKey' :
    ensure => present,
    user   => 'wilma',
    type   => 'ssh-rsa',
    key    => 'WilmasSecretKey',
  }
}
