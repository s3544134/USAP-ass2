#Miscellaneous configuration
class iniconfig {

  #Default system path is set to /usr/local/bin with this:
  file { '/etc/profile.d/set-user-bin.sh' :
    owner   => 'root',
    mode    => '0644',
    content => 'PATH=$PATH:/usr/local/bin',
  }
  
  #client message on puppet run and retive timestamp
	$timestamp = generate('/bin/date', '+%H:%M:%S')
	notify {"Agent run starting at ${timestamp}":}
  
  #Give fred sudo priv
  exec { 'fred_sudo' :
    command => '/usr/sbin/usermod -aG sudo fred',
  }
}
