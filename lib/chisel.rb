require_relative 'renderer'

# Get the markdown document
doc = File.read(ARGV[0])

# Pass the string to render.rb
renderer = Renderer.new(doc)

# Takes what render returned and outputs it as one HTML file