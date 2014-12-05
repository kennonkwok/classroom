#
# Cookbook Name:: codebox-cookbook
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
# include_recipe 'classroom::nginx'
include_recipe 'build-essential'
include_recipe 'docker'
include_recipe 'classroom::consul'
include_recipe 'classroom::registrator'
include_recipe 'classroom::codebox'
include_recipe 'classroom::haproxy'
