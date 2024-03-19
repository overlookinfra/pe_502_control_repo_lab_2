# Copyright 2024. Puppet, Inc., a Perforce company. 
#
# @summary Apply the "Hello World" web app
#
# This class installs and runs the "Hello World" website application.
# See the `teched_hello_world::website` class for more details.
#
# @example
#   include profile::hello_world_app
class profile::hello_world_app {
  include teched_hello_world::website
}
