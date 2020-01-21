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
    convert_inline_code_block
    convert_multiline_code_block
    convert_headings

    output
  end

  def convert_inline_code_block
    @output.gsub!(/\{\{\{([^\n]+?)\}\}\}/, '`\1`')
  end

  def convert_multiline_code_block
    # .は改行を除く任意の一文字。mオプションをつけると改行にもマッチする。
    @output.gsub!(/\{\{\{(.+?)\}\}\}/m, '```\1```')
  end

  def convert_headings
    @output.gsub!(/^\s*\=\=\=\=\=\=\s(.+?)\s\=\=\=\=\=\=\s*$/, '###### \1')
    @output.gsub!(/^\s*\=\=\=\=\=\s(.+?)\s\=\=\=\=\=\s*$/, '##### \1')
    @output.gsub!(/^\s*\=\=\=\=\s(.+?)\s\=\=\=\=\s*$/, '#### \1')
    @output.gsub!(/^\s*\=\=\=\s(.+?)\s\=\=\=\s*$/, '### \1')
    @output.gsub!(/^\s*\=\=\s(.+?)\s\=\=\s*$/, '## \1')
    @output.gsub!(/^\s*\=\s(.+?)\s\=\s*$/, '# \1')
    @output.gsub!(/^\s*\=\=\=\=\=\=\s(.+?)/, '###### \1')
    @output.gsub!(/^\s*\=\=\=\=\=\s(.+?)/, '##### \1')
    @output.gsub!(/^\s*\=\=\=\=\s(.+?)/, '#### \1')
    @output.gsub!(/^\s*\=\=\=\s(.+?)/, '### \1')
    @output.gsub!(/^\s*\=\=\s(.+?)/, '## \1')
    @output.gsub!(/^\s*\=\s(.+?)/, '# \1')
  end

  def convert_links
    @output.gsub!(/\[(http?[^\s\[\]]+)\s([^\[\]]+)\]/, '[\2](\1)')
  end
end

input = STDIN.read
output = TracToMarkdown.convert(input)

STDOUT.write(output)
