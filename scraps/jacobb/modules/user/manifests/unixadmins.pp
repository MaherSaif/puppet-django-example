class user::unixadmins inherits user::virtual {
    # Realize our team members
    realize(
        User['jacob'],
        Group['wheel'],
        File['/home/jacob/.ssh'],
        File['/home/jacob/.ssh/id_rsa.pub'],
        File['/home/jacob/.ssh/authorized_keys'],
        File['/home/jacob/.ssh/id_rsa']
    )
}