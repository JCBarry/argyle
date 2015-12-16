module Argyle
  class Configuration
    attr_accessor :plaid_src, :product, :key, :env, :long_tail

    def initialize
      @plaid_src = "https://cdn.plaid.com/link/stable/link-initialize.js"
      @product = 'connect'
      @env = 'tartan'
      @long_tail = false
    end
  end
end