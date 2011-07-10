class postgresql::running {
    service { 'postgresql':
        ensure => 'running',
    }
}