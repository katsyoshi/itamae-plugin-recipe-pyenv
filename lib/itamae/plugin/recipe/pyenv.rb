DEFAULT_PYENV_ROOT = "/usr/local/pyenv"

def pyenv_root
  if node[:pyenv] && node[:pyenv][:pyenv_root]
    node[:pyenv][:pyenv_root]
  else
    DEFAULT_PYENV_ROOT
  end
end

def pyenv_init
  <<-EOS
    export PYENV_ROOT=#{pyenv_root}
    export PATH="#{pyenv_root}/bin:$PATH"
    eval "$(pyenv init -)"
  EOS
end
