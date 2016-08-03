class nginx {

package { 'nginx':
ensure =>present,
}

 
file {'/var/www':
 ensure => directory,
 owner => 'root',
 group => 'root',
}
 
file { '/etc/ssh/sshd_config':
ensure => file,
owner => 'root',
group => 'root',
require => Package['openssh'],
source => 'puppet:///modules/ssh/sshd_config',
}

service {'nginx':
ensure =>running,
enable =>true,
}

}
