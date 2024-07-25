# frozen_string_literal: true

require 'spec_helper'

describe 'profile::server' do

  it 'creates a user' do
    is_expected.to contain_user('myuser').with(
      ensure: 'present',
      home: '/home/myuser',
      groups: ['sudo', 'ssh'],
    )
  end
  
end
