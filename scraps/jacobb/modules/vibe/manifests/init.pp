class vibe{
    nginx::factory { 'vibe':
        fulldomain  =>'vibe.fo0.net',
        port        => 9047
    }
}

Class['www'] -> Class['vibe']