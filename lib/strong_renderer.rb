class StrongRenderer
  def handles?(chunk)
    chunk.include?("**")
  end
end