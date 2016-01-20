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

## if a github ssh key exists then copy this over to the ssh folder
file '/home/chris/.ssh/github_rsa' do
    owner 'chris'
    mode '0600'
    only_if { File.exists?('synced_ssh/github_rsa') }
end

execute 'copy-github-publickey' do
    command 'cat /synced_ssh/github_rsa >> /home/chris/.ssh/github_rsa'
    only_if { File.exists?('synced_ssh/github_rsa') }
end

# add a bashrc to start up the ssh agent and add github key
file '/home/chris/.bashrc' do
    owner 'chris'
    group 'chris'
    mode '0700'
    action :create
    content 'env=/home/chris/.ssh/agent.env
            if [ ! -f "$env" ]; then
                touch $env
            fi
            agent_is_running() {
                if [ "$SSH_AUTH_SOCK" ]; then
                    ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
                else
                    false
                fi
            }
            agent_has_keys() {
                ssh-add -l >/dev/null 2>&1
            }
            agent_load_env() {
                . "$env" >/dev/null
            }
            agent_start() {
                (umask 077; ssh-agent >"$env")
                . "$env" >/dev/null
            }
            if ! agent_is_running; then
                agent_load_env
            fi
            if ! agent_is_running; then
                agent_start
                ssh-add /home/chris/.ssh/github_rsa
            elif ! agent_has_keys; then
                ssh-add /home/chris/.ssh/github_rsa
            fi
            unset env
            cd ~/.ssh'
end



