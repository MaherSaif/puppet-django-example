class shavn {        
    file { '/etc/nginx/sites-available/shavn.conf':
        ensure  => present,
        source => "puppet:///modules/shavn/shavn-nginx.conf",
        notify  => Service['nginx']
        
    }
    
    file { '/etc/nginx/sites-enabled/shavn':
        ensure  => link,
        target  => '/etc/nginx/sites-available/shavn.conf'
    }
}

Class['www'] -> Class['shavn']