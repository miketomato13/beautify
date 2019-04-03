class Bidding < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  # has_one :user, through: :listing

  has_many_attached :images

  validates :title, presence: true
  validates :body, presence: true

  scope :approved_or_denied_but_not_viewed_by_bidder, -> {
    where(apprv_deny: [true, false], viewed_by_bidder: false)
  }

  def bid_id
    user = User.find(self.user_id)
    return user.id
  end

end
