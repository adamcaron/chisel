class ParagraphRenderer
  def handles?(chunk)
    true
  end

  def transform(chunk)
    <<-EOS
<p>
    #{formatted_text(chunk)}
</p>\n
EOS
  end

  private

  def formatted_text(chunk)
    chunk.chomp.gsub("\n", "\n    ")
  end
end