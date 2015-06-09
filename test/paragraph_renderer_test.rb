require './test/test_helper'
require './lib/paragraph_renderer'

class TestParagraphRenderer < Minitest::Test
  def test_it_exists
    assert ParagraphRenderer
  end

  def test_it_transforms_a_single_line_to_one_paragraph
    input_text = "This is the first line of the paragraph."
    expected_text = <<-EOS
<p>
    This is the first line of the paragraph.
</p>
EOS
    assert_equal expected_text, ParagraphRenderer.new(input_text).transform
  end

  def test_it_transforms_a_multi_line_paragraph
    input_text = <<-EOS
This is the first line of the paragraph.
This is the second line of the same paragraph.
EOS
    expected_text = <<-EOS
<p>
    This is the first line of the paragraph.<br>
    This is the second line of the same paragraph.
</p>
EOS
    assert_equal expected_text, ParagraphRenderer.new(input_text).transform
  end
end