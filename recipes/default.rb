#
# Cookbook Name:: pclint
# Recipe:: default
#
# Copyright 2015, Ivan Li
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'windows'

windows_package 'PC-lint for C/C++' do
  source node['pclint']['installer_path']
  installer_type :wise
  action :install
end

windows_zipfile 'C:/lint' do
  source node['pclint']['patches_zip_path']
  action :unzip
  overwrite true
end

windows_path 'C:\lint' do
  action :add
end

ruby_block "Applying PC-Lint patches" do
  action :run
  block do
    files = Dir.glob("C:/lint/*.lp").sort
    files.each do |f|
      Chef::Log.info("Installing #{f} patch...")
      result = %x(C:\\lint\\lpatch.exe #{f} -dC:\\lint)
      Chef::Log.info("Output: #{result}")
    end
  end
end