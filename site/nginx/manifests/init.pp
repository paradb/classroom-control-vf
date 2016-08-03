class nginx {

package { 'nginx':
ensure =>present,
}

 
file {'/var/www':
 ensure => directory,
 owner => 'root',
 group => 'root',
}
 


service {'nginx':
ensure =>running,
enable =>true,
}

}
