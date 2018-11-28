require 'rails_helper'

RSpec.describe 'Languages API', type: :request do

  base_url = '/api/v1/languages'

  let!(:languages) { create_list(:language, 10) }
  let(:language_id) { languages.first.id }

  describe 'GET /languages' do

    before { get base_url }

    # "status"=>"SUCCESS", "message"=>"Loaded all languages", "data"=>[{},...{}]

    it 'returns languages' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      puts json
      expect(json['status']).to eq('SUCCESS')
      expect(json['message']).to eq("Loaded all languages")
      expect(json['data'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /languages/:id' do
    before { get "#{base_url}/#{language_id}" }

    context 'when the record exists' do
      it 'returns the language' do
        expect(json).not_to be_empty
        puts json
        expect(json['data']['id']).to eq(language_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:language_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Language/)
      end
    end
  end

  # # Test suite for POST /languages
  # describe 'POST /languages' do
  #   # valid payload
  #   let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

  #   context 'when the request is valid' do
  #     before { post base_url, params: valid_attributes }

  #     it 'creates a language' do
  #       expect(json['title']).to eq('Learn Elm')
  #     end

  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end

  #   context 'when the request is invalid' do
  #     before { post base_url, params: { title: 'Foobar' } }

  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end

  #     it 'returns a validation failure message' do
  #       expect(response.body)
  #         .to match(/Validation failed: Created by can't be blank/)
  #     end
  #   end
  # end

  # # Test suite for PUT /languages/:id
  # describe 'PUT /languages/:id' do
  #   let(:valid_attributes) { { title: 'Shopping' } }

  #   context 'when the record exists' do
  #     before { put "#{base_url}/#{language_id}", params: valid_attributes }

  #     it 'updates the record' do
  #       expect(response.body).to be_empty
  #     end

  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end
  #   end
  # end

  # # Test suite for DELETE /languages/:id
  # describe 'DELETE /languages/:id' do
  #   before { delete "#{base_url}/#{language_id}" }

  #   it 'returns status code 204' do
  #     expect(response).to have_http_status(204)
  #   end
  # end
end