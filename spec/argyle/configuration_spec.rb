require 'spec_helper'


describe Argyle::Configuration do

  describe '#plaid_src' do
    it 'should have a default value' do
      expect(Argyle::Configuration.new.plaid_src).to eq("https://cdn.plaid.com/link/stable/link-initialize.js")
    end


    it 'can set value' do
      config = Argyle::Configuration.new
      config.plaid_src = "http://example.com"

      expect(config.plaid_src).to eq("http://example.com")
    end
  end

  describe '#product=' do
    it 'has a default value' do
      config = Argyle::Configuration.new
      expect(config.product).to eq("auth")
    end

    it 'can set value' do
      config = Argyle::Configuration.new
      config.product = "connect"

      expect(config.product).to eq("connect")
    end
  end

  describe '#env=' do
    it 'has a default value' do
      config = Argyle::Configuration.new
      expect(config.env).to eq("tartan")
    end

    it 'can set value' do
      config = Argyle::Configuration.new
      config.env = "production"

      expect(config.env).to eq("production")
    end
  end


  describe '#long_tail=' do
    it 'has a default value' do
      config = Argyle::Configuration.new
      expect(config.long_tail).to eq(false)
    end

    it 'can set value' do
      config = Argyle::Configuration.new
      config.long_tail = true

      expect(config.long_tail).to eq(true)
    end
  end


  describe '#client_id=' do
    it 'can set value' do
      config = Argyle::Configuration.new
      config.client_id = 'myId'

      expect(config.client_id).to eq('myId')
    end
  end

  describe '#secret=' do
    it 'can set value' do
      config = Argyle::Configuration.new
      config.secret = 'mysecret'

      expect(config.secret).to eq('mysecret')
    end
  end

  describe '#env' do
    it 'has a default value (test)' do
      config = Argyle::Configuration.new
      expect(config.env).to eq('tartan')
    end

    it 'has a production value' do
      config = Argyle::Configuration.new
      config.env = 'production'
      expect(config.env).to eq('production')
    end
  end
end
