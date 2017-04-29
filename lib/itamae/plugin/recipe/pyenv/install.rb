case node[:platform]
  when "debian", "ubuntu"
    package "build-essential"
end

package "git"

git node[:pyenv][:pyenv_root] do
  repository "#{node[:pyenv][:scheme]}://github.com/pyenv/pyenv.git"
  user node[:pyenv][:user] if node[:pyenv][:user]
end

pyenv_init = <<-EOS
  export PYENV_ROOT=#{node[:pyenv][:pyenv_root]}
  export PATH="#{node[:pyenv][:pyenv_root]}/bin:$PATH"
  eval "$(pyenv init -)"
EOS

node[:pyenv][:versions].each do |version|
  execute "pyenv install #{version}" do
    command "#{pyenv_init} pyenv install #{version}"
    not_if  "#{pyenv_init} pyenv versions | grep #{version}"
    user node[:pyenv][:user] if node[:pyenv][:user]
  end
end

node[:pyenv][:global].tap do |version|
  execute "pyenv global #{version}" do
    command "#{pyenv_init} pyenv global #{version}"
    not_if  "#{pyenv_init} pyenv version | grep #{version}"
    user node[:pyenv][:user] if node[:pyenv][:user]
  end
end
