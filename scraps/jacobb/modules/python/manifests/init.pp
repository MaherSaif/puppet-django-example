class python {
    package { 'python-pip':
        ensure  => installed;
    }
    
    package { 'python-dev': 
        ensure => installed;
    }
    
    package { 'python-virtualenv':
        ensure  => installed;
    }
    
    file { '/tools':
        ensure  => directory;
        
    }
}