class Chunker
  attr_reader :split_doc

  def initialize(doc)
    @split_doc = doc.split("\n\n")

    # determine the chunk's type (ie. header or list or paragraph)
    # and pass it to it's respective renderer.

    # @split_doc.each do |chunk|
    #   if chunk[0] == "#"
    #     HeaderRender.new(chunk).transform
    #   else
    #   if chunk[0]
    #     ParagrapghRenderer.new(chunk).transform
    #   end
    # end

    # ["hi mom", "## Some heading"]
    # paragraphed = ParagraphRender.new(headerized).transform
    # ["<p>hi mom</p>"]
    # headerized = HeaderRender.new(@split_doc).transform
    # listified = ListRenderer.new(paragraphed).transform
  end
end