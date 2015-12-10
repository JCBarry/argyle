# require 'rails'

module Argyle
  class Engine < ::Rails::Engine

    initializer 'argyle.helper' do
      ActionView::Base.send :include, ArgyleHelper
    end

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
