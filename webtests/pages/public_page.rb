# frozen_string_literal: true

require "base_page.rb"

class PublicPage < BasePage

  def initialize(url)
    super(url)
  end

  def login_link
    SK::Link.new({ link: "Login" })
  end

  def signup_link
    SK::Link.new({ link: "Sign Up" })
  end

  def announcements_link
    SK::Link.new({ link: "What's New" })
  end

end