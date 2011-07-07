#!/bin/sh

set -e

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
PKG_PATH=ftp://ftp.freebsd.org

command -v "ruby" >/dev/null || {
    echo "===>>> Installing Ruby"
    pkg_add -r ruby
    pkg_add -r ruby18-iconv
}

command -v "rake" >/dev/null || {
    echo "===>>> Installing Ruby Rake"
    pkg_add -r rubygem-rake
}

command -v "git" >/dev/null || {
    echo "===>>> Installing Git"
    pkg_add -r git
}

cd /root
test ! -d ./work && {
    (
        mkdir work
        cd work
        command -v "facter" >/dev/null || {
            echo "===>>> Installing Facter"
            curl -O http://puppetlabs.com/downloads/facter/facter-latest.tgz
            tar -zxf facter-latest.tgz
            (cd facter-1.5.8 && /usr/local/bin/ruby install.rb)
        }

        command -v "puppet" >/dev/null || {
            echo "===>>> Installing Puppet"
            curl -O http://puppetlabs.com/downloads/puppet/puppet-latest.tgz
            tar -zxf puppet-latest.tgz
            (cd puppet-2.6.4 && /usr/local/bin/ruby install.rb)
        }

    )
    test -d ./work && {
        echo "===>>> Cleaning up"
        rm -rf ./work
    }
}

test -d /var/lib/puppet || {
    mkdir -p /var/lib/puppet
}

echo "===>>> Bootstrapping our Puppet setup"
/usr/local/bin/puppet apply bootstrap.pp
