class nginx {

package { 'nginx':
ensure =>present,
}

 
file {'/var/www':
 ensure => directory,
 owner => 'root',
 group => 'root',
}
 
file { '/var/www/index.html':
ensure => file,
owner => 'root',
group => 'root',
mode => '0644',
source => 'puppet///modules/nginx/index.html',
}

service {'nginx':
ensure =>running,
enable =>true,
}

}
