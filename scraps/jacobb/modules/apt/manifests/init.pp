class apt{
    class source-list {
        package { 'python-software-properties': 
            ensure => installed
        }
        exec {"add-apt-repository ppa:pitti/postgresql": 
            require => Package['python-software-properties']
        }
    }
    include source-list
    exec { 'apt-get -q update':
    	require => Class['source-list']
    }
}