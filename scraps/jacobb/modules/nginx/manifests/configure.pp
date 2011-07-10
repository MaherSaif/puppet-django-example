class nginx::configure {
    file { '/etc/nginx/nginx.conf': 
            ensure => present,
            mode => '0644',
            owner => 'root',
            group => 'root',
            notify => Service['nginx'],
            source => "puppet:///modules/nginx/nginx.conf"
    }
}