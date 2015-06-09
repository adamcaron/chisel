class Chunker
  attr_reader :split_doc

  def initialize(doc)
    @split_doc = doc.split("\n\n")
  end
end