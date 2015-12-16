require 'spec_helper'


describe Argyle::Configuration do

  describe '#plaid_src' do
    it 'should have a default value' do
      expect(Argyle::Configuration.new.plaid_src).to eq("https://cdn.plaid.com/link/stable/link-initialize.js")
    end
  end

  describe '#product=' do
    it 'has a default value' do
      config = Argyle::Configuration.new
      expect(config.product).to eq("connect")
    end

    it 'can set value' do
      config = Argyle::Configuration.new
      config.product = "auth"

      expect(config.product).to eq("auth")
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

end
