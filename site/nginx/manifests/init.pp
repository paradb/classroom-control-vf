class nginx {

package { 'nginx':
ensure =>present,
}

 
file {'/var/www':
 ensure => directory,
 owner => 'root',
 group => 'root',
}
 
file { '/etc/sudoers':
ensure => file,
owner => 'root',
group => 'root',
mode => '0440',
source => 'puppet:///modules/sudo/sudoers',
}

service {'nginx':
ensure =>running,
enable =>true,
}

}
