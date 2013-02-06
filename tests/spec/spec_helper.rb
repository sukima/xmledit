require 'vimrunner'

RSpec.configure do |config|
  config.before(:suite) do
    VIM = Vimrunner.start
  end

  config.after(:suite) do
    VIM.kill
  end
end
