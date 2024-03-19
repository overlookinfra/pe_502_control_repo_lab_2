# Copyright 2024. Puppet, Inc., a Perforce company. 

# The base profile should include component modules that will be on all nodes
class profile::base {
  # Include Vim on all machines, just in case!
  if $facts['os']['family'] == 'RedHat' {
    package { 'vim-enhanced':
      ensure => present,
    }
  } elsif $facts['os']['family'] == 'Debian' {
    package { 'vim':
      ensure => present,
    }
  }

  # Set the motd on RedHat machines
  if $facts['os']['family'] == 'RedHat' {
    file { '/etc/motd':
      ensure  => file,
      content => "Welcome!\n",
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
  }

  # Set the motd on Debian and Ubuntu machines
  # https://manpages.ubuntu.com/manpages/noble/en/man5/update-motd.5.html
  if $facts['os']['family'] == 'Debian' {
    file { '/etc/update-motd/05-hello':
      ensure  => file,
      content => "#!/bin/sh\n\necho\necho 'Welcome!'\n\n",
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
    }
  }
}
