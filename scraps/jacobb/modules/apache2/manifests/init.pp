class apache2 {
    Class['install'] -> Class['configure'] -> Class['running']
    
    include install
    include running
    include configure
}