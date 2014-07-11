# Encoding: utf-8

require_relative 'spec_helper'

describe file('/usr/sbin/holland') do
  it { should be_file }
end

describe file('/etc/holland/holland.conf') do
  it { should be_file }
end

describe package('holland') do
  it { should be_installed }
end
