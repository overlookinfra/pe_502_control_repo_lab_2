# frozen_string_literal: true

# Copyright 2024. Puppet, Inc., a Perforce company. 

require 'spec_helper'

describe 'profile::hello_world_app' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('teched_hello_world::website') }
    end
  end
end
