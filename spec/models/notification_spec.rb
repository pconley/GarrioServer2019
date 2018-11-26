require 'rails_helper'

RSpec.describe Notification, type: :model do

  actor = FactoryBot.create(:user)
  recipient = FactoryBot.create(:user)
  announcement = FactoryBot.create(:announcement)

  subject { described_class.new(actor: actor, recipient: recipient, notifiable: announcement, action: "a test is comming") }

  # Recipient must exist, Actor must exist, Notifiable must exist

  it "is valid with valid attributes" do
    expect(subject).to be_valid
    expect(subject.save!).to eq(true)
    expect(described_class.count).to eq(1)
  end

end
