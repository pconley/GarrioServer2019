require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  let!(:users)  { create_list(:user, 10) }
  let(:user_id) { users.first.id }
  let(:user_code) { users.first.code }

  describe 'GET /users' do
    before { get api_v1_users_path }
    # it "responds" do puts response.body end
    it_responds_like "a standard response", 200
    it_responds_like "a standard index" do
      let(:resource_cnt) { users.length }
    end
  end

  describe 'GET /users/:id' do
    before { get api_v1_user_path(user_id) }

    context 'when the id exists' do
      # it "responds" do puts response.body end
      it_responds_like "a standard response", 200
      it_responds_like "a standard show" do
        let(:resource_id) { user_id }
      end
      it_responds_with "only expected fields", %w[id email name]
    end

    context 'when the id does not exist' do
      let(:user_id) { 123456 } # bad value
      # it "responds" do puts response.body end
      it_responds_like "a standard response", 404
      it_responds_like "a standard show error"
    end
  end

end