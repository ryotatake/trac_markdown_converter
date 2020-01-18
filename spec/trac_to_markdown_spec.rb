describe TracToMarkdown do
  describe "convert_inline_code_block" do
    before do
      @input = <<-EOS
fuga
{{{inline_code_block}}}
`inline_code_block2`

{{{
multiline_code_block
}}}
      EOS

      @output = <<-EOS
fuga
`inline_code_block`
`inline_code_block2`

{{{
multiline_code_block
}}}
      EOS
    end
    it do
      expect(TracToMarkdown.new(@input).convert_inline_code_block.output).to eq @output
    end
  end
end
