require 'spec_helper'
require 'vimrunner/testing'

describe "Vim plugin xml-edit" do
  include Vimrunner::Testing
  let(:vim) { VIM }

  around :each do |example|
    vim.add_plugin(File.expand_path('../ftplugin'), 'xml.vim')
    tmpdir(vim) do
      example.call
    end
  end

  describe "test" do
    it "should pass" do
      "foo".should eq "foo"
    end
  end
end
