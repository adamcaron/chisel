class EmphasisRenderer
  def handles?(chunk)
    chunk.include?("*")
  end

  def transform(chunk)
    while handles?(chunk)
      chunk.sub!("*", "<em>")
      chunk.sub!("*", "</em>")
    end
    return chunk
  end
end