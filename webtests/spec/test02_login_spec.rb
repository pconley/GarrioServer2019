# frozen_string_literal: true

require_relative 'spec_helper.rb'

RSpec.describe "Login Page" do

  before :each do
    @home_page = HomePage.new()
    @login_page = LoginPage.new()
    @login_page.goto
  end

  it "is present" do
    expect(@login_page).to be_present
    expect(@login_page).to be_here("Remember me")
  end

  it "has expected title" do
    expect(@home_page.title.downcase).to eq(APPNAME.downcase)
  end

  it "has expected labels" do
    expect(@login_page).to have_content("Login")
  end

  it "has expected fields" do
    expect(@login_page.email_field).to exist
    expect(@login_page.password_field).to exist
    expect(@login_page.login_button).to exist
  end

  it "can link to login page" do
    @home_page.login_link.click
    expect(@login_page).to be_present
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
  
  # it "can login with valid credentials" do
  #   @login_page.fill_and_submit($good_user, $good_pass)
  #   expect($TravelFlightPage).to be_present
  #   @login_page.logout
  #   expect(@login_page).to be_present
  # end

  # it "fails to login with invalid password" do
  #   @login_page.fill_and_submit($good_user, "abc123")
  #   expect(@login_page).to have_content("Invalid email or password")
 #    # cannot log out... never got in
  # end

  # it "fails to login with invalid credentials" do
  #   @login_page.fill_and_submit("xuser", "xpassword")
  #   expect(@login_page).to have_content("Invalid email or password")
 #    # cannot log out... never got in
  # end

end
