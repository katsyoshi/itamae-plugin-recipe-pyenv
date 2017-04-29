node.reverse_merge!(
  pyenv: {
    scheme:   'git',
    versions: [],
  },
)

if node[:pyenv][:pyenv_root].nil?
  user_dir = case node[:platform]
    when 'osx', 'darwin'
      '/Users'
    else
      '/home'
  end
  node[:pyenv][:pyenv_root] = File.join(user_dir, node[:pyenv][:user], '.pyenv')
end

include_recipe 'pyenv::install'
