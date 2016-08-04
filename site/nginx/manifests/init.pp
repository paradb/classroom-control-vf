class nginx {

  package { 'nginx':
    ensure =>present,
  }
  
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  
  file {'/var/www':
    ensure  => directory,
  }
  
  file { '/var/www/index.html':
    ensure  => file,
    source => 'puppet:///modules/nginx/index.html',
  }
  
  file { 'default.conf':
    ensure  => file,
    path    => '/etc/nginx/conf.d/default.conf',
    source  => 'puppet:///modules/nginx/default.conf',
  }
  
  file { 'nginx.conf':
    ensure  => file,
    path    => '/etc/nginx/nginx.conf',
    source  => 'puppet:///modules/nginx/nginx.conf',
  }
  
  
  service {'nginx':
    ensure    =>running,
    enable    =>true,
    subscribe => [File['default.conf'],File['nginx.conf']],
}

}
