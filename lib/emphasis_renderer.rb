class EmphasisRenderer
  def handles?(chunk)
    chunk.include?("*")
  end

  def transform(chunk)
    while chunk.include?("*")
      chunk.sub!("*", "<em>")
      chunk.sub!("*", "</em>")
    end
    return chunk
  end
end