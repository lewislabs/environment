## Install the git client
git_client 'default' do
  action :install
end

## update the global git config
template '/home/chris/.gitconfig' do 
    source 'git_setup/gitconfig.erb'
    variables({
        :git_user => node[:git_setup][:git_user],
        :git_email => node[:git_setup][:git_email]
    })
end



