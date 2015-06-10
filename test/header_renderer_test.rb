require_relative 'test_helper'
require_relative '../lib/header_renderer'

class TestHeaderRenderer < Minitest::Test
  def test_it_handles_lines_that_start_with_hash
    assert HeaderRenderer.new.handles?("# Here's a header")
  end

  def test_it_doesnt_handle_lines_without_a_hash
    refute HeaderRenderer.new.handles?("Not a header")
  end

  def test_it_doesnt_handle_mid_line_hashes
    refute HeaderRenderer.new.handles?("Just a # paragraph")
  end

  def test_it_transforms_one_octothorpe_into_an_h1
    renderer = HeaderRenderer.new
    assert_equal "<h1>Here's My Title</h1>", renderer.transform("# Here's My Title")
  end

  def test_it_transforms_two_octothorpes_into_h2
    renderer = HeaderRenderer.new
    assert_equal "<h2>Here's an h2 Subheader</h2>", renderer.transform("## Here's an h2 Subheader")
  end
end