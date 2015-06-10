require_relative 'test_helper'
require_relative '../lib/chunker'

class ChunkerTest < Minitest::Test
#   def test_it_split_on_two_new_lines
#     chunker = Chunker.new("first line\n\nsecond line")
#     assert_equal ["first line", "second line"], chunker.split_doc
#   end

#   def test_it_identifies_a_paragraph
#     skip
#     chunked_document = ParagraphRenderer.new(["# Here's a header", "Not a header"])
#     assert_equal ["# Here's a header"], chunked_document.find_headers
#   end

#   def test_it_identifies_a_header
#     skip
#     chunked_document = HeaderRenderer.new(["# Here's a header", "Not a header"])
#     assert_equal ["# Here's a header"], chunked_document.find_headers
#   end

#   def test_it_distinguishes_between_different_chunk_types
#     skip
#     # determine the chunk's type (ie. header or list or paragraph)
#   end

#   def test_it_passes_chunks_to_their_respective_renderers
#     skip
#   end
end