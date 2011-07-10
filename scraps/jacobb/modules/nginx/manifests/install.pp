class nginx::install {
    package { 'nginx': 
            ensure => '0.7.67-3ubuntu1',
    }
}