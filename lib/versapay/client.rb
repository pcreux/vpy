require "rest-client"
require "json"

module Versapay
  class Client
    def initialize(user, password, environment='secure')
      @user = user
      @password = password
      @environment = environment
    end

    attr_reader :user, :password, :environment

    def url
      "https://#{user}:#{password}@#{environment}.versapay.com/api/transactions.json"
    end

    def send(amount, email, message=nil)
      amount_in_cents = (amount.to_f * 100).to_i

      payload = {
        transaction_type: 'send',
        email: email,
        amount_in_cents: amount_in_cents,
        message: message
      }.to_json

      response_hash = nil

      RestClient.post(url, payload, content_type: :json, accept: :json) do |response, request, result, &block|
        unless response.code == 201
          raise "Error: #{JSON.parse(response.body).inspect}"
        end
        response_hash = JSON.parse(response.body)
      end

      response_hash
    end
  end
end
