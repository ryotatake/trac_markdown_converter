describe TracToMarkdown do
  describe "convert_inline_code_block" do
    before do
      @input = <<-EOS
fuga
{{{inline_code_block}}}
`inline_code_block2`
hoge{{{inline_code_block3}}}hoge

{{{
multiline_code_block
}}}
      EOS

      @output = <<-EOS
fuga
`inline_code_block`
`inline_code_block2`
hoge`inline_code_block3`hoge

{{{
multiline_code_block
}}}
      EOS
    end
    it do
      expect(TracToMarkdown.new(@input).convert_inline_code_block).to eq @output
    end
  end

  describe "convert_headings" do
    before do
      @input = <<-EOS
= h1 =
== h2 ==
=== h3 ===
==== h4 ====
===== h5 =====
====== h6 ======
= h1
== h2
=== h3
==== h4
===== h5
====== h6
  = h1 =
  == h2 ==
  === h3 ===
  ==== h4
  ===== h5
  ====== h6
      EOS

      @output = <<-EOS
# h1
## h2
### h3
#### h4
##### h5
###### h6
# h1
## h2
### h3
#### h4
##### h5
###### h6
# h1
## h2
### h3
#### h4
##### h5
###### h6
      EOS
    end
    it do
      expect(TracToMarkdown.new(@input).convert_headings).to eq @output
    end
  end
end
