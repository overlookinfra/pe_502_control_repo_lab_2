# Copyright 2024. Puppet, Inc., a Perforce company. 
# 
# This role is made of all the profiles that need to be included to make a webserver work
# All roles should include the base profile
class role::webserver {
  include profile::base
  include profile::hello_world_app
}
