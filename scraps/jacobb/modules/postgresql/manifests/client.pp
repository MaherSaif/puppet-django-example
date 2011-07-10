class postgresql::client {
    package { 'postgresql-client':
        ensure  => '9.0.4-1~maverick1'
    }
    
    package { 'libpq-dev':
        ensure  => installed
    }
}