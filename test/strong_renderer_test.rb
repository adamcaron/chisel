require './test/test_helper'
require './lib/strong_renderer.rb'

class StrongRendererTest < Minitest::Test
  def test_it_handles_chunks_with_strong_formatting
    assert StrongRenderer.new.handles?("Some **really** bold text.")
  end

  def test_it_doesnt_handle_chunks_without_strong_formatting
    refute StrongRenderer.new.handles?("Without bold text")
  end

  def test_it_transforms_bold_markdown_into_bold_html
    result = StrongRenderer.new.transform("Some **bold** text.")
    assert_equal "Some <strong>bold</strong> text.", result
  end
end