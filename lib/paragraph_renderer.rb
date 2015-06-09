class ParagraphRenderer
  def initialize(text)
    @text = text
  end

  def transform
    <<-EOS
<p>
    #{formatted_text}
</p>
EOS
  end

  private

  def formatted_text
    @text.chomp.gsub("\n", "<br>\n    ")
  end
end