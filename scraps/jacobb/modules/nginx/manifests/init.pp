class nginx {
    Class['install'] -> Class['configure'] -> Class['running']
    
    include install
    include running
    include configure
}

define nginx::factory($fulldomain, $shortdomain=false, $port=9080) {
    
    file { "/etc/nginx/sites-available/$name.conf":
        ensure  => present,
        content => template("nginx/nginx_conf.erb"),
        notify  => Service['nginx']
        
    }
    
    file { "/etc/nginx/sites-enabled/$name":
        ensure  => link,
        target  => "/etc/nginx/sites-available/$name.conf"
    }
    
}