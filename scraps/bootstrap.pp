# bootstrap.pp
# 
# We bootstrap a git repository so we can push our Puppet changes. We setup a
# git post-receive hook that moves everything to /etc/puppet.

user { "git":
    ensure => "present",
    home => "/var/git",
}

File { ensure => directory, owner => git, group => git }
file {
    "/var/git":
        require => User["git"];
    "/var/git/puppet":
        require => [User["git"],File["/var/git"]];
    "/etc/puppet":
        require => [User["git"],File["/var/git"],File["/var/git/puppet"]];
}

ssh_authorized_key { "git":
    ensure => present,
    key => "KEYHERE",
    name => "user@host.com",
    target => "/var/git/.ssh/authorized_keys",
    type => dsa,
    user => "git",
    require => [File["/var/git"], User["git"]];
}

exec { "/usr/local/bin/git init --bare":
    cwd => "/var/git/puppet",
    user => "git",
    alias => "create-git-repo",
    creates => "/var/git/puppet/HEAD",
    require => [File["/var/git/puppet"], User["git"]],
}
