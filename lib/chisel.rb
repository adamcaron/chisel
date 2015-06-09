require 'chunker'

doc = File.read(ARGV[0])
chunker = Chunker.new(doc)

# Takes what joiner returned and outputs it as one HTML file