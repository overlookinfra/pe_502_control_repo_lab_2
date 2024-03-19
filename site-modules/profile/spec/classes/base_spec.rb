# frozen_string_literal: true

# Copyright 2024. Puppet, Inc., a Perforce company. 

require 'spec_helper'

describe 'profile::base' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end

  context "on Rocky Linux" do
    let(:facts) do
      {
        'os' => {
          'family'  => 'RedHat',
          'name'    => 'Rocky',
        }
      }
    end

    it { is_expected.to contain_package('vim-enhanced') }
    it { is_expected.to contain_file('/etc/motd').with_mode('0644') }
  end

  context "on Ubuntu" do
    let(:facts) do
      {
        'os' => {
          'family'  => 'Debian',
          'name'    => 'Ubuntu',
        }
      }
    end

    it { is_expected.to contain_package('vim') }
    it { is_expected.to contain_file('/etc/update-motd/05-hello').with_mode('0755') }
  end
end
