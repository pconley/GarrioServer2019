class Rank < ApplicationRecord

    belongs_to :user
    belongs_to :language
      
    validates :user_id, uniqueness: { scope: [:language_id], message: "cannot have multiple ranks in a language."  }
    
    validates :level, :inclusion => {:in => -20..5, message: "out of range"}
    validates :level, :exclusion => {:in => [0], message: "cannot be zero"}

    # scope :unread, -> { where(read_at: nil) }
    # scope :recent, -> { order(created_at: :desc).limit(5) }

  end
  