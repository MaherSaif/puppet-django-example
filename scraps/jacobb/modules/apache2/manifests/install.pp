class apache2::install {
    package { 'apache2': 
        ensure => '2.2.16-1ubuntu3.1'
    }
    
    package { 'libapache2-mod-wsgi':
        ensure  => '3.2-2'
    }
}