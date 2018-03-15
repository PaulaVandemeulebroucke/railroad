class Offer < ApplicationRecord
  belongs_to :user
  include PgSearch
  has_many :bookings, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  pg_search_scope :global_search,
    against: [:address, :description, :company_name ],
    using: {
      tsearch: { prefix: true }
    }
end

