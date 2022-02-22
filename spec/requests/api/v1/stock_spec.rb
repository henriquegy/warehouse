require 'rails_helper'

RSpec.describe "Api::V1::Stocks", type: :request do
  describe "Analise of stock" do
    let(:user_login) { create(:user) }
    let(:headers) { {'X-User-Email' => user_login.email.to_s, 'X-User-Token' => user_login.authentication_token.to_s} }

    it 'Respond 200 OK' do
      get '/api/v1/stock', headers: headers
      expect(response.status).to eq(200)
    end

    it 'Update stock' do
      product_entry_params = {
        :product_entry => {
          :weight => "15",
          :meditate_unit => "toneladas",
          :prodentry_with_batch_stocks_attributes => {
              :stocks_attributes => [
                  {
                      :name => "Armazem Bezerra",
                      :batches_attributes => [{
                          :name => "Soja",
                          :weight => "15",
                          :meditate_unit => "kilogramas"
                      }]
                  }
              ]
          }
        }
      }

      post '/api/v1/product_entry', params: product_entry_params, headers: headers

      res = JSON.parse(response.body)

      stock_id_old = res["stock"].first["id"].to_s
      stock_name_old = res["stock"].first["name"].to_s

      stock_params = {
        :stock => {
          :name => "Test update name"
        }
      }

      put "/api/v1/stock/#{stock_id_old}", params: stock_params, headers: headers

      res = JSON.parse(response.body)

      expect(res["name"]).to eq("Test update name")
      expect("Test update name").not_to be == stock_name_old
    end
  end
end
