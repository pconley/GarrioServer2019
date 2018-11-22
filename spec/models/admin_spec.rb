require 'rails_helper'

# NOTE: really the user (with admin set)

RSpec.describe User, type: :model do

  subject { described_class.new(email: "xxx@xxx.xxx", password: "password", admin: true) }

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

  it "has set the admin flag" do
    expect(subject.admin).to eq(true)
  end

  ### VERiFY WE HAVE BOTS

  it "has a basic factory bot" do
    # Returns a User instance that's not saved
    admin = FactoryBot.build(:admin)
    expect(admin).to be_valid
  end


end
