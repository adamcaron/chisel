require 'chisel'

class IntegrationTest < Minitest::Test
  def test_it_properly_renders_a_markdown_document
    input = <<-MARKDOWN
# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."
MARKDOWN

    output = <<-HTML
<h1>My Life in Desserts</h1>

<h2>Chapter 1: The Beginning</h2>

<p>
  "You just <em>have</em> to try the cheesecake," he said. "Ever since it appeared in
  <strong>Food &amp; Wine</strong> this place has been packed every night."
</p>
HTML

    parser = Chisel.new

    assert_equal normalize_whitespace(output), normalize_whitespace(parser.parse(input))
  end

  private

  def normalize_whitespace(string)
    string.gsub(/\s+/, " ").gsub(/(\<[^\<\>]+\>) /, '\1')
  end
end