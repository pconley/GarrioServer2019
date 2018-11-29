RSpec.shared_examples "index examples" do  |code|
    # it { expect(subject).to respond_with(:ok) }
    # it { expect(subject).to render_template(:index) }

    it 'has a standard response' do 
        expect(response).to have_http_status(code)
        expect(response.content_type).to eq("application/json")
        body = JSON.parse(response.body)
        expect(body).not_to be_empty
    end
end