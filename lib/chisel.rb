require 'chunker'
require 'header_renderer'
require 'paragraph_renderer'

class Chisel
  def parse(markdown)
    Chunker.new(markdown, [
      HeaderRenderer.new,
      ParagraphRenderer.new
    ]).result
  end
end