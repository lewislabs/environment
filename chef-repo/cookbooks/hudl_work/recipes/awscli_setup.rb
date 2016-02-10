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

# Create a virtualenv for awscli_farm
python_virtualenv "/home/chris/Documents/Development/virtualenv/hudl_awscli_farm" do
    owner "chris"
    group "chris"
    options "--always-copy"
    action :create
end

# install awscli into this virtualenv
python_pip "awscli" do
    virtualenv "/home/chris/Documents/Development/virtualenv/hudl_awscli_farm"
end

farm_activate = "/home/chris/Documents/Development/virtualenv/hudl_awscli_farm/bin/activate"
farm_profile = "export AWS_DEFAULT_PROFILE=hudl_farm"
ruby_block "set default profile for Farm account" do
    block do
        file = Chef::Util::FileEdit.new(farm_activate)
        file.insert_line_if_no_match(/AWS_DEFAULT_PROFILE/, farm_profile)
        file.write_file
    end
end
