class TracToMarkdown
  attr_reader :output

  def self.convert(input)
    self.new(input).convert
  end

  def initialize(input)
    @input = input
    @output = input.clone
  end

  def convert
  end

  def convert_inline_code_block
    @output.gsub!(/\{\{\{([^\n]+?)\}\}\}/, '`\1`')
    self
  end
end
