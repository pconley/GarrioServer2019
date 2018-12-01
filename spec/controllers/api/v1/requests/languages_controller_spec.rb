require 'rails_helper'

RSpec.describe 'Languages API', type: :request do

  let!(:languages)  { create_list(:language, 10) }
  let(:language_id) { languages.first.id }
  let(:language_code) { languages.first.code }

  describe 'GET /languages' do
    before { get api_v1_languages_path }
    # it "responds" do puts response.bodyend
    it_responds_like "a standard response", 200
    it_responds_like "a standard index" do
      let(:resource_cnt) { languages.length }
    end
  end

  describe 'GET /languages/:id' do
    before { get api_v1_language_path(search_key) }

    context 'when the id exists' do
      let(:search_key) { language_id }
      # it "responds" do puts response.body end
      it_responds_like "a standard response", 200
      it_responds_like "a standard show" do
        let(:resource_id) { language_id }
      end
      it_responds_with "only expected fields", %w[id name code]
    end

    context 'when the code exists' do
      let(:search_key) { language_code }
      # it "responds" do puts response.body end
      it_responds_like "a standard response", 200
      it_responds_like "a standard show" do
        let(:resource_id) { language_id }
      end
      it_responds_with "only expected fields", %w[id name code]
    end

    context 'when the id/code does not exist' do
      let(:search_key) { 123456 } # bad value
      # it "responds" do puts response.body end
      it_responds_like "a standard response", 404
      it_responds_like "a standard show error"
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