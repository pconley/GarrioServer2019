require 'rails_helper'

RSpec.describe 'Languages API', type: :request do

  let!(:languages) { create_list(:language, 10) }
  let(:language_id) { languages.first.id }

  # language_url = "#{V1_BASE_URL}/languages"

  describe 'GET /languages' do
    before { get api_v1_languages_path }

    include_examples "index examples", 200

    it 'returns languages' do
      # expect(response.content_type).to eq("application/json")
      # expect(response).to have_http_status(200)
      body = JSON.parse(response.body)
      # expect(body).not_to be_empty
      status, message, data = parse(body)
      expect(status).to eq(OK_STATUS)
      expect(message).to match(/loaded/)
      expect(data.size).to eq(10)
    end
  end

  describe 'GET /languages/:id' do

    before { get api_v1_language_path(language_id) }

    context 'when the record exists' do

      include_examples "index examples", 200

      it 'returns the language' do
        # expect(response).to have_http_status(200)
        # expect(response.content_type).to eq("application/json")
        body = JSON.parse(response.body)
        # expect(body).not_to be_empty
        status, message, data = parse(body)
        expect(status).to eq(OK_STATUS)
        expect(message).to match(/loaded/)
        expect(data['id']).to eq(language_id)
      end
    end

    context 'when the record does not exist' do
      let(:language_id) { 100 }

      include_examples "index examples", 404

      it 'returns error information' do
        # expect(response).to have_http_status(404)
        body = JSON.parse(response.body)
        # expect(body).not_to be_empty
        status, message, data = parse(body)
        expect(status).to eq(ERR_STATUS)
        expect(message).to match(/not found/)
        expect(data).to be_nil
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