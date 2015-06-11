require 'chunker'
require 'header_renderer'
require 'paragraph_renderer'
require 'emphasis_renderer'

class Chisel
  def parse(markdown)
    Chunker.new(markdown, [
      HeaderRenderer.new,
      ParagraphRenderer.new
      ],
      EmphasisRenderer.new).result
  end
end