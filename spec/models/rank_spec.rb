require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = FactoryBot.create(:user)
    @lang1 = FactoryBot.create(:language)
    @lang2 = FactoryBot.create(:language)
  end

  it "can assign ranks to a user" do
    # by creating a rank object directly
    FactoryBot.create(:rank, user: @user, language: @lang1, level: 3)
    # or by using the user ranks create
    @user.ranks.create(language: @lang2, level: 4)
    expect(@user).to be_valid
    expect(@user.ranks.count).to eq(2)
  end

  it "cannot have multiple ranks in same languager" do
    FactoryBot.create(:rank, user: @user, language: @lang1, level: 3)
    expect {
        FactoryBot.create(:rank, user: @user, language: @lang1, level: 4) 
    }.to raise_error(/cannot have multiple ranks/)

    expect(@user).to be_valid
    expect(@user.ranks.count).to eq(1)
  end

  it "cannot have zero level" do
    expect {
        FactoryBot.create(:rank, user: @user, language: @lang1, level: 0)
    }.to raise_error(/cannot be zero/)
  end

  it "cannot exceed godan" do
    expect {
        FactoryBot.create(:rank, user: @user, language: @lang1, level: 6)
    }.to raise_error(/out of range/)
  end

  it "cannot be less than -20" do
    expect {
        FactoryBot.create(:rank, user: @user, language: @lang1, level: -21)
    }.to raise_error(/out of range/)
  end

end
