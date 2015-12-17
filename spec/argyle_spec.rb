require 'spec_helper'

describe Argyle do
  describe '#configure' do
    it 'responds to .configure' do
      expect(Argyle).to respond_to(:configure)
    end

    it 'makes configuration accessible' do
      expect(Argyle.configuration).to respond_to(:plaid_src)
    end
  end

  describe '#Error' do
    it 'specifies an error' do
      expect { raise Argyle::Error }.to raise_exception(Argyle::Error)
    end
  end

  describe '#plaid_client' do
    it 'responds to plaid_client' do
      expect(Argyle).to respond_to(:plaid_client)
    end
  end
end