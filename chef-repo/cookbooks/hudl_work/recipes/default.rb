#
# Cookbook Name:: hudl_work
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "hudl_work::user_create"
include_recipe "hudl_work::git_setup"
include_recipe "hudl_work::chefdk_setup"
# Installs python, pip and virtualenv
include_recipe "python::default"
include_recipe "hudl_work::awscli_setup"
