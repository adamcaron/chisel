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

  def transform
    find_headers.each do |header|
      HEADERS.each do |html, markdown|
        header.gsub!( /^#{markdown}\s(?<stuff>(.)+)/, "<#{html}>#{'\k<stuff>'}</#{html}>" )
      end
    end
  end

end