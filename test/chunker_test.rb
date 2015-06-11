require './test/test_helper'
require './lib/chunker'

class ChunkerTest < Minitest::Test
  def test_it_renders_md_headers_to_html
    doc = "One paragraph\n\nAnother paragraph"
    result = Chunker.new(doc, [HeaderRenderer.new, ParagraphRenderer.new], EmphasisRenderer.new, StrongRenderer.new ).result
    assert_equal ["One paragraph", "Another paragraph"], result
  end

  def test_it_renders_md_paragraphs_to_html
    skip
  end

  def test_it_renders_md_emphasis_to_html_em
    skip
  end

  def test_it_renders_bold_md_as_strong_html
    skip
  end

  def test_it_joins_rendered_chunks_into_an_html_doc
    skip
  end
end