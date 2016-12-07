class Book < ApplicationRecord
  has_many :reviews, as: :reviewable
  belongs_to :author, optional: true, counter_cache: true
  validates :author, presence: { if: :new_data? }

  before_create :update_author_name

  scope :with_title, -> { where.not(title: nil) }
  scope :newer_than, ->(year) { where('year >= ?', year) }

  delegate :first_name, to: :author, prefix: true
  delegate :created_at, to: :author, prefix: true

  attr_accessor :price

  BOOK_VAT = 10

  def price_with_vat
    return if price.nil?
    price * (100 + BOOK_VAT) / 100
  end

  def reviews_count
    reviews.count
  end

  private

  def new_data?
    created_at.nil? || created_at > Date.new(2016, 11, 22)
  end

  def update_author_name
    self.author_name = author.to_s
  end
end
