require "test_helper"

class ItamaePluginRecipePyenvTest < Test::Unit::TestCase
  def test_installed
    assert File.exist?("/usr/local/pyenv/"), "cannot find pyenv in system"
    assert File.exist?("/home/itamae/pyenv/"), "cannot find pyenv in user"
  end
end
