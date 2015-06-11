class EmphasisRenderer
  def handles?(chunk)
    chunk.include?("*")
  end

  def transform(chunk)
    count = 0
    chunk.chars.map do |char|
      if char == "*" && count == 0
        count += 1
        "<em>"
      elsif char == "*" && count == 1
        "</em>"
      else
        char
      end
    end.join
  end
end