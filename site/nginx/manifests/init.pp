class nginx {


case $::operatingsystem {
  'redhat', 'centos': { include redhat  } # apply the RedHat class
  'debian', 'ubuntu': { include debian  } # apply the Debian class
  'windows'         : { include windows } # apply the Windows class
  'amazon': {
    include amazon                       # include our EC2 config
    include redhat                       # as well as the base RedHat class
  }
  'solaris': {
      include solaris
      notify { "Please see ${release_notes} for information on current Solaris support.": }
  }
  default:  { fail("Unsupported OS: ${::operatingsystem}") }
}




  package { 'nginx':
    ensure =>present,
  }
  
  File {
    ensure  => file,
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  
  file {'/var/www':
    ensure  => directory,
  }
  
  file { '/var/www/index.html':
    source => 'puppet:///modules/nginx/index.html',
  }
  
  file { 'default.conf':
    path    => '/etc/nginx/conf.d/default.conf',
    source  => 'puppet:///modules/nginx/default.conf',
  }
  
  file { 'nginx.conf':
    path    => '/etc/nginx/nginx.conf',
    source  => 'puppet:///modules/nginx/nginx.conf',
  }
  
  
  service {'nginx':
    ensure    =>running,
    enable    =>true,
    subscribe => [File['default.conf'],File['nginx.conf']],
}

}
