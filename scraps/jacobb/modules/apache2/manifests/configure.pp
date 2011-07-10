class apache2::configure {
    file { '/etc/apache2/apache2.conf': 
            ensure => present,
            mode => '0644',
            owner => 'root',
            group => 'root',
            notify => Service['apache2'],
            source => "puppet:///modules/apache2/apache2.conf"
    }
}