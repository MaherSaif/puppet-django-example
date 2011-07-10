class jbcom {
    nginx::factory { 'jacobburch':
        fulldomain  => 'www.jacobburch.com',
        shortdomain => 'jacobburch.com',
        port        => 9080
    }
}

Class['www'] -> Class['jbcom']