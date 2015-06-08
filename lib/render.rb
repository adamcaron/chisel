# Chisel reads the markdown file

# Get the initial markdown document
# Separate the file into chunks of text (delineated by blank lines)
# Classify those chunks of text (by header or paragraph)
# Based on what type of chunk it is, send it to it's respective renderer.
# Combine all chunks back into one, gigantic string

# Takes what render returned and outputs it as one HTML file