class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :notifications, foreign_key: :recipient_id
  has_many :services

  belongs_to :native_language, class_name: "Language", foreign_key: 'native_id'

  validates_length_of :name, minimum: 3, maximum: 30, allow_blank: true

  def to_s
    "User##{id} #{email}"
  end

end
