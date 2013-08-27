require 'tmpdir'
require 'vimrunner'

RSpec.configure do |config|
  plugin_path = File.expand_path("#{File.dirname(__FILE__)}/../../ftplugin")

  config.around do |example|
    Dir.mktmpdir do |dir|
      Dir.chdir(dir) do
        VIM.command("cd #{dir}")
        vim.add_plugin plugin_path, "xml.vim"
        example.call
      end
    end
  end

  config.before(:suite) do
    VIM = Vimrunner.start
  end

  config.after(:suite) do
    VIM.kill
  end
end
