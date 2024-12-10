class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :starting_date, presence: true, future_date: true
  validates :ending_date, presence: true

  validate :ending_date_after_starting_date

  before_validation :normalize_name

  # Scopes
  scope :in_past_month, -> { where(ending_date: 1.month.ago..1.day.ago) }
  scope :with_concert_word, -> { where("description LIKE '%concert%'") }

  private

  def ending_date_after_starting_date
    ending_date = self.ending_date || Time.now
    starting_date = self.starting_date || Time.now
    errors.add(:ending_date, :after_starting_date) if ending_date < starting_date
  end

  def normalize_name
    self.name = self.name.strip.titleize if self.name.present?
  end
end
