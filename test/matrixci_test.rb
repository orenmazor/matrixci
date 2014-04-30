require './test/test_helper'

class MatrixCiTest < Minitest::Test
  def test_projectlist
    assert MatrixCi::Project.all.any?
  end

  def test_failed_get
    OpenURI.expects(:open_uri).twice.raises(OpenURI::HTTPError.new("foo","bar")).then.returns(StringIO.new("{}"))
    puts MatrixCi::Project.all.first.all_recent_builds
  end
end
