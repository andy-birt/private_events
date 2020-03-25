class Event < ApplicationRecord

  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :invites, inverse_of: 'event'
  has_many :attendees, through: :invites

  scope :past,     -> { where('date < ?', Time.current).order(date: :desc) }
  scope :upcoming, -> { where('date > ?', Time.current).order(date: :asc) }

  def show_date
    date.strftime("%A, %B %-d %l:%M %P")
  end

end
