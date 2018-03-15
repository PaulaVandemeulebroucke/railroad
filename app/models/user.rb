class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :offer, dependent: :destroy
  has_many :bookings, dependent: :destroy
  acts_as_voter

  def likes
    self.votes.up.for_type(Offer)
  end
end
