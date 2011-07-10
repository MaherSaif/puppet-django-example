class user::root {
    user { 'root':
        uid => '0',
        comment => 'root',
        ensure => 'present',
        gid => '0',
        home => '/root',
        shell => '/bin/zsh'
    }

    file { '/root/.zshrc':
        ensure => present,
        mode => '0600',
        source => "puppet:///modules/user/root_zshrc"
    }
}