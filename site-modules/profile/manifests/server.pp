# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::server
class profile::server {
  user { 'myuser':
    ensure => present,
    home   => '/home/myuser',
    groups => ['sudo', 'ssh'],
  }
}
