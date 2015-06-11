require './test/test_helper'
require './lib/paragraph_renderer'

class TestParagraphRenderer < Minitest::Test
  def test_it_handles_everything
    assert ParagraphRenderer.new.handles?("literally anything")
  end

  def test_it_transforms_a_single_line_to_one_paragraph
    input_text = "This is the first line of the paragraph."
    expected_text = <<-EOS
<p>
    This is the first line of the paragraph.
</p>\n
EOS
    assert_equal expected_text, ParagraphRenderer.new.transform(input_text)
  end

  def test_it_transforms_a_multi_line_paragraph
    input_text = "This is the first line of the paragraph. This is the second line of the same paragraph."
    expected_text = <<-EOS
<p>
    This is the first line of the paragraph. This is the second line of the same paragraph.
</p>\n
EOS
    assert_equal expected_text, ParagraphRenderer.new.transform(input_text)
  end
end