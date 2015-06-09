require_relative 'test_helper'
require_relative '../lib/chunker'

class ChunkerTest < Minitest::Test
  def test_it_split_on_two_new_lines
    chunker = Chunker.new("first line\n\nsecond line")
    assert_equal ["first line", "second line"], chunker.split_doc
  end
end