class Chunker
  attr_reader :split_doc

  def initialize(doc)
    @split_doc = doc.split("\n\n")

    # determine the chunk's type (ie. header or list or paragraph)
    # and pass it to it's respective renderer.

    @split_doc.each do |chunk|
      if chunk[0] == "#"
          # classifier/identifier/locator will be a task of chunker,
          # this responsibility will be removed from HeaderRenderer and given to Chunker
          def find_headers
            @chunked_strings.select { |string| string.match(/^\#{1,6} /) }
          end
        HeaderRender.new(chunk).transform
      else
        ParagrapghRender.new(chunk).transform
      end
    end

    # ["hi mom", "## Some heading"]
    # paragraphed = ParagraphRender.new(headerized).transform
    # ["<p>hi mom</p>"]
    # headerized = HeaderRender.new(@split_doc).transform
    # listified = ListRenderer.new(paragraphed).transform
  end
end