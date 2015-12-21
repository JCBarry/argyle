require 'spec_helper'

describe ArgyleHelper do
  describe "#plaid_link" do
    before do
      @options = {form_id: 'ohai', name: 'ohai', action: plaid_index_path}
    end

    it "responds to plaid_link" do
      expect(helper).to respond_to(:plaid_link)
    end

    it "raises exception if public key not set" do
      Argyle.configuration.key = nil
      expect { helper.plaid_link(@options) }.to raise_exception(Argyle::Error)
    end

    it "raises exception if name is not in options" do
      @options[:name] = nil
      expect { helper.plaid_link(@options) }.to raise_exception(Argyle::Error)
    end

    it "raises exception if action is not in options" do
      @options[:action] = nil
      expect { helper.plaid_link(@options) }.to raise_exception(Argyle::Error)
    end
  end

  describe "#plaid_link_form" do
    it "returns plaid form with specified action" do
      expect(helper.plaid_link_form('myId', plaid_index_path)).to eq('<form id="myId" action="/plaid/index" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" />')
    end

    it "returns plaid form with specified id" do
      expect(helper.plaid_link_form('myId', plaid_index_path)).to eq('<form id="myId" action="/plaid/index" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" />')
    end
  end

  describe "#plaid_link_script" do
    it "returns plaid script with" do
    end
  end
end