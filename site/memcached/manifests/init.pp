class memcached {

package { 'memcached':
  ensure => present,
  before => File['/etc/sysconfig/memcached']
}


file { '/etc/sysconfig/memcached':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:////modules/memcached',
  notify => Service ['memcached'],
}

service { 'memcached':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/sysconfig/memcached'],
}



}
