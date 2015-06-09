class HeaderRenderer

  HEADERS = {
    "h1" => "#",
    "h2" => "##",
    "h3" => "###",
    "h4" => "####",
    "h5" => "#####",
    "h6" => "######"
  }
  # Instead of passing a group of chunked strings, the chunker passes one header at a time
  # so, here, 'chunked_strings' can be renamed to 'header'.
  def initialize(chunked_strings)
    @chunked_strings = chunked_strings
  end
  # classifier/identifier/locator will be a task of chunker,
  # this responsibility will be removed from HeaderRenderer and given to Chunker
  def find_headers
    @chunked_strings.select { |string| string.match(/^\#{1,6} /) }
  end

  def transform
    find_headers.each do |header|
      HEADERS.each do |html, markdown|
        header.gsub!( /^#{markdown}\s(?<stuff>(.)+)/, "<#{html}>#{'\k<stuff>'}</#{html}>" )
      end
    end
  end

end