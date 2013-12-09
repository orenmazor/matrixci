require './test/test_helper'

class MatrixCiTest < Minitest::Test
  def test_projectlist
    assert MatrixCi::Project.all.any?
  end
end
