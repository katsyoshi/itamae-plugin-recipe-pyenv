node.reverse_merge!(
  pyenv: {
    pyenv_root: '/usr/local/pyenv',
    scheme:     'git',
    versions:   [],
  },
)

include_recipe 'pyenv::install'