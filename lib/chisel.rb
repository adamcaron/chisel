require 'chunker'
require 'header_renderer'
require 'paragraph_renderer'
require 'emphasis_renderer'
require 'strong_renderer'

class Chisel
  def parse(markdown)
    Chunker.new(markdown, [
      HeaderRenderer.new,
      ParagraphRenderer.new
      ],
      EmphasisRenderer.new,
      StrongRenderer.new
      ).result
  end
end