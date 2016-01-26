# Create a virtualenv for awscli
python_virtualenv "/home/chris/Documents/Development/virtualenv/hudl_awscli" do
    owner "chris"
    group "chris"
    options "--always-copy"
    action :create
end

# install awscli into this virtualenv
python_pip "awscli" do
    virtualenv "/home/chris/Documents/Development/virtualenv/hudl_awscli"
end 
