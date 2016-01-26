group 'chris' do
    gid '1010'
    action :create
end 

user 'chris' do
  uid '1011'
  group 'chris'
  home '/home/chris'
  shell '/bin/bash'
end

# The home directory won't be created unless there's a flag set in etc/login.defs
directory '/home/chris' do
  owner 'chris'
  group 'chris'
  mode '0755'
  action :create
end

# create a ssh directory
directory '/home/chris/.ssh' do
  owner 'chris'
  group 'chris'
  mode '0755'
  action :create
end

# add my public key to authorized_keys
file '/home/chris/.ssh/authorized_keys' do
    action :create
end

# if a id_rsa key exists in /synced_ssh then stick that into the authorized_keys
execute 'add-authorized-key' do
    command 'cat /synced_ssh/id_rsa.pub >> /home/chris/.ssh/authorized_keys'
    only_if { File.exists?('synced_ssh/id_rsa.pub') }
end



