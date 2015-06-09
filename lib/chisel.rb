require_relative 'chunker'

doc = File.read(ARGV[0])
chunker = Chunker.new(doc)

# Takes what render returned and outputs it as one HTML file