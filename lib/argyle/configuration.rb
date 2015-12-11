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



# data-client-name  required  Displayed once a user has successfully linked their account.
# data-form-id  required  The DOM ID associated with form that the Link module will append the public_key to as a hidden input and submit when a user completes the onboarding flow.
# data-product  required  The Plaid product you wish to use, either "auth" or "connect".
# data-key  required  The public_key associated with your account; available form the dashboard.
# data-env  required  The Plaid API environment on which to create user accounts.,For development and testing, use "tartan". For production use, use "production".

# Note: all "production" requests are billed.
# data-webhook  optional  Specify a webhook to associate with a user.
# data-token  optional  Specify an existing user's public token to launch Link in update mode. This will cause Link to open directly to the authentication step for that user's institutiton.
# data-long-tail  optional  Set to true to launch Link with longtail institution support enabled. Longtail institutions are only available with Connect (data-product is connect).

# Note: Your account must be enabled for longtail usage - contact signups@plaid.com to gain access.