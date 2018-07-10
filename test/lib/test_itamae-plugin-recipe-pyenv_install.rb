require "test_helper"

class ItamaePluginRecipePyenvTest < Test::Unit::TestCase
  def test_system_installed
    assert File.exist?("/usr/local/pyenv/"), "cannot find pyenv in system"
  end

  def test_system_configuration
    assert File.exist?("/etc/profile.d/90.pyenv.sh"), "cannot find config in profile.d"
  end

  def test_user_installed
    assert File.exist?("/home/itamae/.pyenv/"), "cannot find pyenv in user"
  end
end
