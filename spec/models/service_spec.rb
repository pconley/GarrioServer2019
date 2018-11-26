require 'rails_helper'

RSpec.describe Service, type: :model do

  before(:each) do
    @service = FactoryBot.create(:service)
  end

  it "factory is setup" do
    expect(@service).to be_valid
    expect(@service.save!).to eq(true)
    expect(Service.count).to eq(1)
  end

end