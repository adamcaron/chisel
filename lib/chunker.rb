class Chunker
  def initialize(doc, renderers)
    @doc = doc
    @renderers = renderers
  end

  def result
    chunks = @doc.split("\n\n")
    parsed_chunks = chunks.map do |chunk|
      renderer = renderer_for(chunk)
      renderer.transform(chunk)
    end
    parsed_chunks.join
  end

  private

  def renderer_for(chunk)
    @renderers.find { |r| r.handles?(chunk) }
  end
end