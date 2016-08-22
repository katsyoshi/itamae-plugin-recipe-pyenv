case node[:platform]
when "debian", "ubuntu"
  package "build-essential"
end

package "git"

require "itamae/plugin/recipe/pyenv"

scheme = "git"
scheme = node[:pyenv][:scheme] if node[:pyenv][:scheme]

git pyenv_root do
  repository "#{scheme}://github.com/yyuu/pyenv.git"
end

node[:pyenv][:versions].each do |version|
  execute "pyenv install #{version}" do
    command "#{pyenv_init} pyenv install #{version}"
    not_if  "#{pyenv_init} pyenv versions | grep #{version}"
  end
end

node[:pyenv][:global].tap do |version|
  execute "pyenv global #{version}" do
    command "#{pyenv_init} pyenv global #{version}"
    not_if  "#{pyenv_init} pyenv version | grep #{version}"
  end
end
