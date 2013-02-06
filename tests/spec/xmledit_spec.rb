require 'spec_helper'
require 'vimrunner/testing'

describe "Vim plugin xml-edit" do
  include Vimrunner::Testing
  let(:vim) { VIM }

  around :each do |example|
    plugin_path = File.expand_path('../ftplugin')
    vim.add_plugin plugin_path, "xml.vim"
    tmpdir(vim) do
      example.call
    end
  end

  it "should define last_wrap_tag_used" do
    vim.command("echo exists('b:last_wrap_tag_used')").should eq "1"
  end
  it "should define last_wrap_atts_used" do
    vim.command("echo exists('b:last_wrap_atts_used')").should eq "1"
  end

  describe "#WrapTag" do
    before do
      write_file("test.xml", "foobar")
    end
    # it "should pass" do
    #   vim.edit "test.xml"
    #   vim.type "\\F"
    #   vim.write
    #   IO.read("test.xml").should eq "<testtag testattr>foobar</testtag>"
    # end
  end
end
