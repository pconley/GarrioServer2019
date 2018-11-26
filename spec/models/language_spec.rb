require 'rails_helper'

RSpec.describe Language, type: :model do

  before(:each) do
    @language = FactoryBot.create(:language)
  end

  it "factory is setup" do
    expect(@language).to be_valid
    expect(@language.save!).to eq(true)
    expect(Language.count).to eq(1)
  end

end
