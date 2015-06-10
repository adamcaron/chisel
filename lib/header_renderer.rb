class HeaderRenderer
  def handles?(chunk)
    chunk.start_with?("#") &&
      first_character_after_hashes(chunk) == " "
  end

  def transform(chunk)
    characters_to_drop = number_of_hashes(chunk) + 1
    header_tag = "h#{number_of_hashes(chunk)}"
    content = chunk[characters_to_drop..-1]
    "<#{header_tag}>" + content + "</#{header_tag}>\n\n"
  end

  private

  def number_of_hashes(chunk)
    chunk.chars.take_while { |char| char == '#' }.length
  end

  def first_character_after_hashes(chunk)
    chunk.chars.drop_while { |char| char == '#' }.first
  end
end