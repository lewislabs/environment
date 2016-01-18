user 'chris' do
  group 'root'
  home '/home/chris'
  shell '/bin/bash'
end

# The home directory won't be created unless there's a flag set in etc/login.defs
directory '/home/chris' do
  owner 'chris'
  group 'root'
  mode '0755'
  action :create
end

# create a ssh directory
directory '/home/chris/.ssh' do
  action :create
end