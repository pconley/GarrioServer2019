# frozen_string_literal: true

require "public_page.rb"

class SignupPage < PublicPage

  def initialize()
    super('users/sign_up')
  end

  def email_field
    SK::Field.new({ id: 'user_email' })
  end

  def password_field
    SK::Field.new({ id: 'user_password' })
  end

  def login_button
    SK::Button.new({ type: "submit" })
  end

  def fill_and_submit(user=$good_user, pass=$good_pass)
    email_field.set(user)
    password_field.set(pass)
    login_button.click(2) # and wait 2 secs
  end

end

$SignupPage = SignupPage.new()