module Argyle
  class Configuration
    attr_accessor :plaid_src, :product, :key, :env, :long_tail, :customer_id, :secret

    def initialize
      @plaid_src = "https://cdn.plaid.com/link/stable/link-initialize.js"
      @product = 'auth'
      @env = 'tartan'
      @long_tail = false
    end

    def environment_location
      return "https://api.plaid.com/" if @env == 'production'
      "https://tartan.plaid.com/"
    end
  end
end