# frozen_string_literal: true

require "public_page.rb"

class AnnouncementsPage < PublicPage

  def initialize()
    super('announcements')
  end

end

$AnnouncementsPage = AnnouncementsPage.new()
