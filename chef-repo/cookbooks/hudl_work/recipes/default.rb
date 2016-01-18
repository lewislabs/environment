#
# Cookbook Name:: hudl_chef_work
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "hudl_work::user_create"
include_recipe "hudl_work::git_setup"
