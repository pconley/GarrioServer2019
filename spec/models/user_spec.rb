require 'rails_helper'

RSpec.describe User, type: :model do

  subject { described_class.new(email: "xxx@xxx.xxx", password: "password") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
    expect(subject.save!).to eq(true)
    expect(described_class.count).to eq(1)
  end

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
    expect(subject.save).to eq(false)
    expect(described_class.count).to eq(0)
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
    expect(subject.save).to eq(false)
    expect(described_class.count).to eq(0)
  end

  it "defaults to not admin" do
    expect(subject.admin).to eq(false)
  end

  it "can be set admin" do
    subject.admin = true
    expect(subject.admin).to eq(true)
    expect(subject.save).to eq(true)
    expect(described_class.count).to eq(1)
  end

  ### VERiFY WE HAVE BOTS

  it "has a basic factory bot" do
    # Returns a User instance that's not saved
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end


end

