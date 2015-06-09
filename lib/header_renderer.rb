class HeaderRenderer

  HEADERS = {
    "h1" => "#",
    "h2" => "##",
    "h3" => "###",
    "h4" => "####",
    "h5" => "#####",
    "h6" => "######"
  }

  def initialize(chunked_strings)
    @chunked_strings = chunked_strings
  end

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