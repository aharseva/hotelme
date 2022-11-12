class Hotel < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_index,
  against: [ :name, :address ],
  using: {
    tsearch: { prefix: true }
  }
end
