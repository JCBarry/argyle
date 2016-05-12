class Argyle::CallbackController < ApplicationController
  before_filter :plaid_exchange_token

  def plaid_access_token
    @plaid_access_token ||= plaid_exchange_token.access_token
  end

  def plaid_user
    @plaid_user ||= Argyle.plaid_client::User.load(plaid_access_token, plaid_products)
  end

  protected

  def plaid_public_token
    raise Argyle::Error, "public token not present in request" unless params[:public_token]
    params[:public_token]
  end

  def plaid_exchange_token
    @plaid_access_token_response ||= Argyle.plaid_client::User.exchange_token(plaid_public_token, params[:account_id])
  end

  def plaid_products
    Array(Argyle.configuration.product)
  end
end
