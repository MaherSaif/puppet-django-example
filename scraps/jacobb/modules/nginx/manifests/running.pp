class nginx::running {
    service { 'nginx':
        ensure => 'running',
    }
}