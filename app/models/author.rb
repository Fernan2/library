class Author < ApplicationRecord
  validates :email, :first_name, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end
end
