class apache2::running {
    service { 'apache2':
        ensure => 'running',
    }
}