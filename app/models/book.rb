class Book < ApplicationRecord
  has_many :reviews, as: :reviewable
  belongs_to :author, optional: true, counter_cache: true
  validates :author, presence: { if: :new_data? }

  scope :with_title, -> { where.not(title: nil) }
  scope :newer_than, ->(year) { where('year >= ?', year) }

  private

  def new_data?
    created_at.nil? || created_at > Date.new(2016, 11, 22)
  end
end
