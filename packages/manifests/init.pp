#setting up and installing packages

class packages {
  
  #yum dependencies
  exec { 'getDeps' :
    onlyif  => '/usr/bin/yum-config-manager',
    command => '/usr/bin/yum-config-manager --enable rhui-REGION-rhel-server-optional',
  }
  
  #create package array
	$pkgs = [ 'openssh', 'mysql-server', 'mysql-client', 'vncserver', 'tmux', 'lynx', 'gcc',
	'gdb', 'vim', 'emacs' ]
	
	#for different operating systems
	$apache_server = $::operatingsystem ? {
    		Fedora  => 'httpd',
    		default => 'apache2',
  	}
	
	#install packages
 	package { $apache_server:
    		ensure => 'installed',
    		alias  => 'apache_server',
        provider => 'yum',
  	}
	
	package { $pkgs: 
		ensure => 'installed',
    provider => 'yum',
	}
  
  #sshfs
  $sshfspkgs = [ 'glib*', 'fuse*' ]
  
  package { $sshfspkgs: 
		ensure => 'installed',
    provider => 'yum',
	}
  
  package { 'fuse-sshfs': 
		ensure => 'installed',
    source => 'ftp://195.220.108.108/linux/dag/redhat/el7/en/x86_64/dag/RPMS/fuse-sshfs-2.5-1.el7.rf.x86_64.rpm',
    provider => 'rpm',
	}
  
  #dia2code
  package { 'libxml2.so.2': 
		ensure => 'installed',
	}
  
  -> package { 'dia2code':
    ensure   => 'installed',
    source   => 'https://downloads.sourceforge.net/project/dia2code/dia2code/0.8.3/dia2code-0.8.3-3.1.i586.rpm?r=http%3A%2F%2Fdia2code.sourceforge.net%2Fdownload.html&ts=1507292790&use_mirror=ncu',
    provider => 'rpm',
  }
  
  #cgdb
  
  package { 'cgdb':
    ensure   => 'installed',
    source   => 'ftp://mirror.switch.ch/pool/4/mirror/epel/7/x86_64/c/cgdb-0.6.8-1.el7.x86_64.rpm',
    provider => 'rpm',
  }
  
}
