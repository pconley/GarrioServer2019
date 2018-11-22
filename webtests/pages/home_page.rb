# frozen_string_literal: true

require "public_page.rb"

class HomePage < PublicPage

  def initialize()
    super('')
  end

  def present?
    self.here? 'Welcome to Jumpstart'
  end

end