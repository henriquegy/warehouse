require 'rails_helper'

RSpec.describe "Api::V1::ProductEntries", type: :request do
  describe "GET /index" do
    let(:user_login) { create(:user) }
    let(:product_entry) { create(:product_entry, :with_a_stocks) }
    let(:headers) { {'X-User-Email' => user_login.email.to_s, 'X-User-Token' => user_login.authentication_token.to_s} }

    it 'have entries' do
      get '/api/v1/product_entry', headers: headers
      expect(response.body).to eq('[]')
    end

    it 'entry with one stock and one batch' do
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

      byebug

      expect(response.body).to include_json(
        id: /\d/
      )
    end

    it 'entry with one stock and many batch' do
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
                          :meditate_unit => "toneladas"
                      },
                      {
                        :name => "Arroz",
                        :weight => "18",
                        :meditate_unit => "kilogramas"
                      }
                    ]
                  }
              ]
          }
        }
      }

      post '/api/v1/product_entry', params: product_entry_params, headers: headers

      expect(response.body).to include_json(
        id: /\d/
      )
    end

    it 'entry with many stock and many batch' do
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
                          :meditate_unit => "toneladas"
                      },
                      {
                        :name => "Arroz",
                        :weight => "18",
                        :meditate_unit => "kilogramas"
                      }
                    ]
                  },
                  {
                    :name => "Armazem Chapeco",
                    :batches_attributes => [{
                          :name => "Uva",
                          :weight => "15",
                          :meditate_unit => "toneladas"
                      },
                      {
                        :name => "Trigo",
                        :weight => "18",
                        :meditate_unit => "kilogramas"
                      }
                    ]
                  }
              ]
          }
        }
      }

      post '/api/v1/product_entry', params: product_entry_params, headers: headers

      expect(response.body).to include_json(
        id: /\d/
      )
    end
  end
end
