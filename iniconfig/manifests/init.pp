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
  
  #Give becca sudo priv
  augeas { "sudofred":
    context =&gt; "/files/etc/sudoers",
    changes =&gt; [
        "set spec[user = 'becca']/user fred",
        "set spec[user = 'becca']/host_group/host ALL",
        "set spec[user = 'becca']/host_group/command SERVICES",
        "set spec[user = 'becca']/host_group/command/runas_user root",
        "set spec[user = 'becca']/host_group/command/tag NOPASSWD",
    ],
}
  
  #puppet check-in interval
  augeas { 'puppet_updateint' :
    context => '/etc/puppetlabs/puppet/puppet.conf/agent',
    changes => 'set runinterval 20m',
  }
}
