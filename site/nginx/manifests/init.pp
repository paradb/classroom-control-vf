class nginx {

package { 'nginx':
ensure =>present,
}




service {'nginx':
ensure =>running,
enable =>true,
subscribe => [File['default.conf'],File['nginx.conf']]
}

}
