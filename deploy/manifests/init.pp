class deploy {

  # copy individual file /etc/puppetlabs/puppet/modules/deploy/files/test.txt into /tmp directory
  file { 'test.txt':
    path => '/tmp/test.txt',
    source => 'puppet:///modules/deploy/test.txt',
  }
  

  # copy directory /etc/puppetlabs/puppet/modules/deploy/files into /home/ec2-user/tmp recursively
  file { '/home/ec2-user/tmp':
    ensure => directory,
    mode => 0755,
    owner => 'root',
    group => 'root',
    recurse => true,
    source => 'puppet:///modules/deploy',
  }


  # untar the tarball at the desired location
  exec { "untar maytar.tar.gz":
    command => "/bin/rm -rf /tmp/subtest; /bin/tar xzvf /home/ec2-user/tmp/subdir/mytar.tar.gz -C /tmp/",
  }

}

include deploy
