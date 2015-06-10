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

  def test_it_transforms_one_hash_into_h1
    renderer = HeaderRenderer.new
    assert_equal "<h1>Here's My Title</h1>\n\n", renderer.transform("# Here's My Title")
  end

  def test_it_transforms_two_hashes_into_h2
    renderer = HeaderRenderer.new
    assert_equal "<h2>Here's an h2 Subheader</h2>\n\n", renderer.transform("## Here's an h2 Subheader")
  end

  def test_it_transforms_three_hashes_into_h3
    renderer = HeaderRenderer.new
    assert_equal "<h3>Here's an h3 Subheader</h3>\n\n", renderer.transform("### Here's an h3 Subheader")
  end

  def test_it_transforms_four_hashes_into_h4
    renderer = HeaderRenderer.new
    assert_equal "<h4>Here's an h4 Subheader</h4>\n\n", renderer.transform("#### Here's an h4 Subheader")
  end

  def test_it_transforms_five_hashes_into_h5
    renderer = HeaderRenderer.new
    assert_equal "<h5>Here's an h5 Subheader</h5>\n\n", renderer.transform("##### Here's an h5 Subheader")
  end

  def test_it_transforms_six_hashes_into_h6
    renderer = HeaderRenderer.new
    assert_equal "<h6>Here's an h6 Subheader</h6>\n\n", renderer.transform("###### Here's an h6 Subheader")
  end
end