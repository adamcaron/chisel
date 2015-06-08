
class renderer
  # Get the file
  def initialize(doc)
    @doc = doc
  end
  # Separate the document into chunks of text (delineated by blank lines)
  def pass_to_chunker

  end
end

# Classify those chunks of text (by header or paragraph)
# Based on what type of chunk it is, send it to it's respective renderer.
# Combine all chunks back into one, gigantic string