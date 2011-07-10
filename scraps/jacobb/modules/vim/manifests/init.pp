class vim {
    file { "/etc/vim/colors":
        ensure => directory,
        owner => root,
        group => root,
        mode => 0664
    }
    
    file { "/etc/vim/vimrc":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0664,
        source => "puppet:///modules/vim/vimrc"
    }
    
    file { "/etc/vim/colors/ir_black":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0664,
        source => "puppet:///modules/vim/colors/ir_black"
    }
}