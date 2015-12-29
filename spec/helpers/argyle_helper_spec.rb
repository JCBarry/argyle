require 'spec_helper'

describe ArgyleHelper do
  before(:each) do
    Argyle.configuration.key = 'key'
    @options = {form_id: 'ohai', name: 'ohai', action: plaid_index_path}
  end

  describe "#plaid_link" do
    it "responds to plaid_link" do
      expect(helper).to respond_to(:plaid_link)
    end

    it "raises exception if public key not set" do
      Argyle.configuration.key = nil
      expect { helper.plaid_link(@options) }.to raise_exception(Argyle::Error, "Public key must be set in Argyle configuration")
    end

    it "raises exception if name is not in options" do
      @options[:name] = nil
      expect { helper.plaid_link(@options) }.to raise_exception(Argyle::Error, "options[:name] is required for Plaid Link")
    end

    it "raises exception if action is not in options" do
      @options[:action] = nil
      expect { helper.plaid_link(@options) }.to raise_exception(Argyle::Error, "options[:action] is required for Plaid Link")
    end

    it "sets a default id" do
      @options.delete :form_id
      expect(helper).to receive(:plaid_link_form).with('plaidForm', plaid_index_path).and_return("")
      helper.plaid_link(@options)
    end

    it "sets a default product" do
      expect(helper).to receive(:plaid_link_script).with('ohai', 'ohai', 'auth', 'tartan').and_return("")
      helper.plaid_link(@options)
    end

    it "sets a default env" do
      expect(helper).to receive(:plaid_link_script).with('ohai', 'ohai', 'auth', 'tartan').and_return("")
      helper.plaid_link(@options)
    end

    it "returns the form and script HTML" do
      expect(helper.plaid_link(@options)).to eq("<form id=\"ohai\" action=\"/plaid/index\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><script src=\"https://cdn.plaid.com/link/stable/link-initialize.js\" data-client-name=\"ohai\" data-form-id=\"ohai\" data-key=\"key\" data-product=\"auth\" data-env=\"tartan\">\n//<![CDATA[\n\n//]]>\n</script>")
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
      expect(helper.plaid_link_script('id', 'name', 'product', 'env')).to eq("<script src=\"https://cdn.plaid.com/link/stable/link-initialize.js\" data-client-name=\"name\" data-form-id=\"id\" data-key=\"key\" data-product=\"product\" data-env=\"env\">\n//<![CDATA[\n\n//]]>\n</script>")
    end
  end
end