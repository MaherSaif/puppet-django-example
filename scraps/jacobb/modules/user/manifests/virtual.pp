# virtual.pp
#
# People accounts of interest as virtual resources

class user::virtual {
    @user { "jacob":
        ensure  => "present",
        groups  => ['wheel'],
        comment => "Jacob Burch",
        home    => "/home/jacob",
        managehome => true,
        shell   => "/bin/bash",
        require => Group["wheel"],
    }


    # This is broken in 2.6.1, sadly.
    #@ssh_authorized_key { "jacob_auth_key":
    #    ensure  =>"present",
    #    key     => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNhU38lmNmMb92nQ0QjW4PundXTH1+jEV2UAo0YWoNYkBrqk9FFCuSQkzTsvF3UFf0DjPrbkrDcXPB8Xa8GVzAxIpkNEFJR1OViUMUHOVQeQOFqOCATCfluPCDq2HrOjynSwVpEueHhLEaGXiSPo2DmZrGzGufvux1jzi5w6STIhFdyXYO5Ew7h2iZO8Rkest27W835+rV90hcsPz9pdIcgVDIBu6vcNxi5HzbZ0Tygwo6P36nUuXTiBj+3UVa/BcJ0DpcNy712WXA4i3aQR9OD4zFl63PijxEQCSDMVbh9aq5kV10+lJBovkwAnWktjqblnkpS+qmxK9qovZ7aEjrShwrR2+Jeqp3tzeVnq4aW3v7S8W9jIy0eZs/n8r7zWU/mOitrvfDREvtkoNBFwHTU8drbW2VQgW8g3HiTEg9gqDhW02NDqxdLsCmy9/WFs+cctm/Riy0K8I1i35gSqwoqXTs46Avy/8gvZ+77HobMG1BdGR3wZTaB2zCQ4t5M7qbIAE4iZvrubYp6ysiOwqYVS/a6AKq9NkiDh+ss5lMn+UAJYxaoVeF5cG/h6h06JcX/ofs/99TgXFAibriAJT9cV3DxNOr0rqYi7zzZhWH/yadnPpLuyqYjDBXZdAG+ucJBRPHtict601tijtfBiBvNaN2xRPcNNQR7IVx8bJxGQ== jacob@fo0",
    #    type    => ssh-rsa,
    #    user    => "jacob",
    #}

    @file { "/home/jacob/.ssh":
        ensure  => directory,
        mode    => '0700',
        owner   => 'jacob',
        group   => 'jacob'
    }
    
    @file { "/home/jacob/.ssh/id_rsa.pub":
        ensure  =>  "present",
        mode    => '0644',
        owner   => "jacob",
        group   => "jacob",
        source => "puppet:///modules/user/jacob_id_rsa.pub",
        backup => false
    }
    
    @file { "/home/jacob/.ssh/id_rsa":
        ensure  =>  "present",
        mode    => '0600',
        owner   => "jacob",
        group   => "jacob",
        source => "puppet:///modules/user/jacob_id_rsa",
        backup => false
    }
    
    @file { "/home/jacob/.ssh/authorized_keys":
        ensure  =>  "present",
        mode    => '0644',
        owner   => "jacob",
        group   => "jacob",
        source => "puppet:///modules/user/jacob_auth_keys",
        backup => false
    }
    
    @group { "wheel":
        ensure  => "present",
        gid     => '1001'
    }
}

