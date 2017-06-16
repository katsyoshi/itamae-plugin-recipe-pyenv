require "itamae-plugin-recipe-pyenv"

if node.pyenv.user?
  include_recipe "pyenv::user"
else
  include_recipe "pyenv::system"
end
