class postgresql::configure {
    file { '/etc/postgresql/9.0/main/postgresql.conf': 
            ensure => present,
            mode => '0640',
            owner => 'postgres',
            group => 'postgres',
            notify => Service['postgresql'],
            content => template("postgresql/postgresql.conf")
    }
    
    file { '/etc/postgresql/9.0/main/pg_hba.conf': 
            ensure => present,
            mode => '0640',
            owner => 'postgres',
            group => 'postgres',
            notify => Service['postgresql'],
            source => "puppet:///modules/postgresql/pg_hba.conf"
    }
}