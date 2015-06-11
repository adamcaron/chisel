class StrongRenderer
  def handles?(chunk)
    chunk.include?("**")
  end

  def transform(chunk)
    while handles?(chunk)
      chunk.sub!("**", "<strong>")
      chunk.sub!("**", "</strong>")
    end
    return chunk
  end
end