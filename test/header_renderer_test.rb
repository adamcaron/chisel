require_relative 'test_helper'
require_relative '../lib/header_renderer'

class TestHeaderRenderer < Minitest::Test
  # identification happens in the chunker
  # so HeaderRenderer will be relieved of this responsibility
  def test_it_identifies_octothorpes
    chunked_document = HeaderRenderer.new(["# Here's a header", "Not a header"])
    assert_equal ["# Here's a header"], chunked_document.find_headers
  end

  def test_it_transforms_one_octothorpe_into_an_h1
    chunked_document = HeaderRenderer.new(["# Here's My Title"])
    assert_equal ["<h1>Here's My Title</h1>"], chunked_document.transform
  end

  def test_it_transforms_two_octothorpes_into_h2
    chunked_document = HeaderRenderer.new(["## Here's an h2 Subheader"])
    assert_equal ["<h2>Here's an h2 Subheader</h2>"], chunked_document.transform
  end

  def test_it_doesnt_transform_midline_octothorpes
    chunked_document = HeaderRenderer.new(["# Here's My Title", "Just a # paragraph"])
    assert_equal ["<h1>Here's My Title</h1>"], chunked_document.transform
  end
end