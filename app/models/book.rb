class Book < ApplicationRecord
  belongs_to :author, optional: true
  validates :author, presence: { if: :new_data? }

  private

  def new_data?
    created_at.nil? || created_at > Date.new(2016, 11, 22)
  end
end
