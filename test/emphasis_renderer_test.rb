require './test/test_helper'
require './lib/emphasis_renderer'

class EmphasisRendererTest < Minitest::Test
  def test_it_exists
    assert EmphasisRenderer
  end

  def test_it_handles_chunks_with_emphasis
    assert EmphasisRenderer.new.handles?("<h2>Some *Awesome* Title</h2>"), "It should accept strings with markdown *emphasis*"
  end

  def test_it_doesnt_handle_chunks_without_emphasis
    refute EmphasisRenderer.new.handles?("<h2>Just a Header</h2>"), "It shouldn't receive/handle/accept chunks without *emphasis*"
  end

  def test_it_transforms_markdown_emphasis_to_html
    result = EmphasisRenderer.new.transform("<h2>Some *Awesome* Title</h2>")
    assert_equal "<h2>Some <em>Awesome</em> Title</h2>", result
  end

  def test_it_differentiates_between_emphasis_and_strong
    # while includes **, sub em
    # while includes *, sub strong
  end
end