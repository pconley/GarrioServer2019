require 'rails_helper'

RSpec.describe Announcement, type: :model do

  # t.datetime "published_at"
  # t.string "announcement_type"
  # t.string "name"
  # t.text "description"

  subject { described_class.new(name: "test1", description: "a test is comming") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
    expect(subject.save!).to eq(true)
    expect(described_class.count).to eq(1)
  end

  it "defaults to a new type" do
    expect(subject).to be_valid
    expect(subject.announcement_type).to eq("new")
  end

  it "requires a name" do
    subject.name = nil
    expect(subject).to_not be_valid
    expect(subject.save).to eq(false)
    expect(subject.errors.full_messages[0]).to eq("Name can't be blank")
    expect(described_class.count).to eq(0)
  end

    it "requires a name" do
    subject.name = nil
    expect(subject).to_not be_valid
    expect(subject.save).to eq(false)
    expect(subject.errors.full_messages[0]).to eq("Name can't be blank")
    expect(described_class.count).to eq(0)
  end

  it "requires a description" do
    subject.description = nil
    expect(subject).to_not be_valid
    expect(subject.save).to eq(false)
    expect(subject.errors.full_messages[0]).to eq("Description can't be blank")
    expect(described_class.count).to eq(0)
  end


end
