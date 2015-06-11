class Chunker
  attr_reader :doc, :renderers, :emphasis

  def initialize(doc, renderers, emphasis)
    @doc = doc
    @renderers = renderers
    @emphasis = emphasis
  end

  def result
    chunks = doc.split("\n\n")
    parsed_chunks = chunks.map do |chunk|
      renderer = renderer_for(chunk)
      transformed = renderer.transform(chunk)
      emphasis.transform(transformed)
    end
    parsed_chunks.join
  end

  private

  def renderer_for(chunk)
    renderers.find { |r| r.handles?(chunk) }
  end
end