class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings
  has_many :biddings
  has_one :profile

  # def profile
  #   super || create_profile
  # end

  def has_made_offer?(listing)
    self.biddings.index{|i| i.listing.id === listing.id }
  end
  def owner(listing)
    self == listing.user
  end
end
