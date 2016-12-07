class Author < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :books
  validates :email, :first_name, presence: true

  REDIRECTED_AUTHORS = { '124' => 7, '25' => 2 }

  def to_s
    "#{first_name} #{last_name}"
  end
end
