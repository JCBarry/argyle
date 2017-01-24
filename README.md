# Argyle [![Build Status](https://travis-ci.org/JCBarry/argyle.svg)](https://travis-ci.org/JCBarry/argyle) [![Code Climate](https://codeclimate.com/github/JCBarry/argyle/badges/gpa.svg)](https://codeclimate.com/github/JCBarry/argyle) [![Test Coverage](https://codeclimate.com/github/JCBarry/argyle/badges/coverage.svg)](https://codeclimate.com/github/JCBarry/argyle/coverage)
A Rails plugin to make adding Plaid Link integrations super easy.  The plugin aims to remove some of the boilerplate and prioritize configuration-over-code.  It also encapsulates the [plaid-ruby](https://github.com/plaid/plaid-ruby) library for use throughout your application.

[Plaid](https://plaid.com) is the API for banking data.  
[Plaid API documentation](https://plaid.com/docs)

### If you're attempting to use Stripe ACH with Plaid Link you'll need to get the `1.0.0.beta` version of the gem which supports the latest version of the Plaid Ruby Library.  [Updated documentation](https://github.com/JCBarry/argyle/tree/1.0.beta).

## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'argyle'
```

And then execute:

```
$ bundle
```

## Configuration

Create an initializer named `argyle.rb` in your `config/initializers/` directory.
It should look like this:

```ruby
Argyle.configure do |config|
  config.key = 'test_key'         # Public key from Plaid
  config.secret = "test_secret"   # Secret from Plaid
  config.customer_id = "test_id"  # Client ID from Plaid
end
```

You may also _optionally_ configure the following:

```ruby
config.env = "production"         # defaults to 'tartan' (Plaid's test environment)
config.product = "connect"        # defaults to 'auth'
```

## Using the Helper
The `plaid_link` helper takes the following options:

```ruby
:name => required     # name of the customer used in Plaid Link flow
:action => required   # form action that will be called on successful authentication
:id => 'plaidForm'    # HTML id of the form
:env => 'tartan'      # overrides Argyle.configuration.env
:product => 'auth'    # overrides Arygle.configuration.product
:webhook => optional  # optionally set a webhook for a user
:token => optional    # optionally use an existing token
:data => optional     # optionally set a data attribute. Example: `:data => { :longtail => true }`
```

Simply place the helper in any of your views to add the Plaid button:

```erb
<%= plaid_link(:name => 'Tony Soprano', :action => my_callback_path) %>      
```

## Using the Callback Controller (optional)
Argyle ships with an application controller that takes care of the Plaid token exchange and quickly gives you access to a Plaid user and access token.  You can choose to use this controller to scaffold your Plaid Link callback by simply extending it, like so:

```ruby
class MyPersonalCallBack < Argyle::CallbackController
  ...
end
```

Inside your controller you now have access to the following methods:

`plaid_access_token` - the raw access token for the authenticated user.  You'll most likely want to store this in the DB.  
`plaid_user` - an instance of a Plaid User (as defined in [plaid-ruby](https://github.com/plaid/plaid-ruby))

## Access to the Plaid client
Since we make use of the Plaid client within Argyle, it is also exposed for your use if you need to make calls to the Plaid API. `Argyle.plaid_client` returns an instance of Plaid from [plaid-ruby](https://github.com/plaid/plaid-ruby)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jcbarry/argyle. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](CODE_OF_CONDUCT.md) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
