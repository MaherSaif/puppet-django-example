include user:virtual
class www {
    user { "deploy":
        ensure  => present,
        #uid     => "1002",
        groups  => ['wheel'],
        comment => "Web File User",
        managehome => true,
        require => Group["wheel"],
    }
    
    file { "/var/www":
        ensure  => directory,
        owner   => 'deploy',
        group   => 'wheel',
        mode    => '0644'
    }
}
