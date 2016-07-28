require "spec_helper"

describe Argyle::CallbackController do

  describe "plaid_access_token" do
    before do
      controller.params[:public_token] = 'myPublicToken'
      allow(controller).to receive(:plaid_exchange_token).and_return(Plaid::User.new(nil, access_token: 'myToken'))
    end

    it "calls plaid_exchange_token" do
      expect(controller).to receive(:plaid_exchange_token)
      controller.plaid_access_token
    end

    it "returns a plaid access token" do
      expect(controller.send(:plaid_access_token)).to eq('myToken')
    end
  end

  describe "plaid_user" do
    before do
      allow(controller).to receive(:plaid_access_token).and_return('myAccessToken')
      allow(controller).to receive(:plaid_products).and_return(["auth"])
    end

    it "calls Plaid.set_user method" do
      expect(Argyle.plaid_client::User).to receive(:load).with(["auth"], 'myAccessToken')
      controller.plaid_user
    end
  end

  describe "plaid_exchange_token" do
    before(:each) do
      controller.params[:public_token] = 'myPublicToken'
      controller.params[:account_id] = 'myAccountId'
      allow(Argyle.plaid_client::User).to receive(:exchange_token).and_return(Plaid::User.new(nil))
    end

    it "calls the Plaid.exchange_token method" do
      expect(Argyle.plaid_client::User).to receive(:exchange_token).with('myPublicToken', 'myAccountId')
      controller.send(:plaid_exchange_token)
    end

    it "returns a plaid access_token_response" do
      expect(controller.send(:plaid_exchange_token)).to be_a(Plaid::User)
    end
  end

  describe "plaid_products" do
    it "returns an array" do
      expect(controller.send(:plaid_products)).to be_a(Array)
    end

    it "returns configured products in array" do
      expect(controller.send(:plaid_products).count).to eq(1)
      expect(controller.send(:plaid_products).first).to eq("auth")
    end
  end

  describe "plaid_public_token" do
    it "raises if public_token is not present" do
      expect{controller.send(:plaid_public_token)}.to raise_exception(Argyle::Error)
    end
  end
end
