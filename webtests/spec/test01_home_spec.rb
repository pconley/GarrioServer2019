# frozen_string_literal: true

require_relative 'spec_helper.rb'

RSpec.describe "Home Page" do

  before :each do
    @home_page = HomePage.new()
    @home_page.goto
  end

  it "is present" do
    expect(@home_page).to be_present
  end

  it "has expected title" do
    expect(@home_page.title.downcase).to eq(APPNAME.downcase)
  end

  it "has expected labels" do
    expect(@home_page).to have_content("What's New")
    expect(@home_page).to have_content("Sign Up")
    expect(@home_page).to have_content("Login")
  end

  it "can link to login page" do
    @home_page.login_link.click
    login_page = LoginPage.new()
    expect(login_page).to be_present
  end

  it "can link to signup page" do
    @home_page.signup_link.click
    signup_page = SignupPage.new()
    expect(signup_page).to be_present
  end

  it "can link to announcement page" do
    @home_page.announcements_link.click
    announcements_page = AnnouncementsPage.new()
    expect(announcements_page).to be_present
  end

end