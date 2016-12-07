class Author < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :books
  validates :email, :first_name, presence: true

  before_save :clean_name

  REDIRECTED_AUTHORS = { '124' => 7, '25' => 2 }

  def to_s
    "#{first_name} #{last_name}".strip
  end

  private

  def clean_name
    self.first_name = first_name.titleize
    self.last_name = last_name.to_s.titleize
  end
end
