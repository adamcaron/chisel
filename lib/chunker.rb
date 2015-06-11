class Chunker
  attr_reader :doc, :renderers, :emphasis, :strong

  def initialize(doc, renderers, emphasis, strong)
    @doc = doc
    @renderers = renderers
    @emphasis = emphasis
    @strong = strong
  end

  def result
    parsed_chunks = chunk(doc).map do |chunk|
      renderer = renderer_for(chunk)
      transformed = renderer.transform(chunk)
      formatted = strong.transform(transformed)
      emphasis.transform(formatted)
    end
    parsed_chunks.join
  end

  private

  def renderer_for(chunk)
    renderers.find { |r| r.handles?(chunk) }
  end

  def chunk(doc)
    doc.split("\n\n")
  end
end