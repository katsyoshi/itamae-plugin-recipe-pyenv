case node.platform
when 'debian', 'ubuntu'
  package 'build-essential'
when 'redhat', 'fedora', 'amazon'
  package 'gcc'
  package 'zlib-devel'
  package 'openssl-devel'
end

package 'git'

pyenv = node.pyenv
raise "Node does not include pyenv" if pyenv.nil?
git pyenv.pyenv_root do
  repository "#{pyenv.scheme}://github.com/pyenv/pyenv.git"
  user node.pyenv.user if pyenv.user
end

pyenv_init = <<~EOS
  export PYENV_ROOT=#{pyenv.pyenv_root}
  export PATH="#{pyenv.pyenv_root}/bin:$PATH"
  eval "$(pyenv init -)"
EOS

pyenv.versions.each do |version|
  execute "pyenv install #{version}" do
    command "#{pyenv_init} pyenv install #{version}"
    not_if  "#{pyenv_init} pyenv versions | grep #{version}"
    user pyenv.user if pyenv.user
  end
end

pyenv.global.tap do |version|
  execute "pyenv global #{version}" do
    command "#{pyenv_init} pyenv global #{version}"
    not_if  "#{pyenv_init} pyenv version | grep #{version}"
    user pyenv.user if pyenv.user
  end
end
