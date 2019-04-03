class Profile < ApplicationRecord
  include Rails.application.routes.url_helpers
  before_save { |profile| profile.name = profile.name.downcase }
  before_save { |profile| profile.location = profile.location.downcase }

  belongs_to :user

  has_one_attached :avatar

  # has_one :email, -> (email) { where(user_id: ) }

  has_many :listings, through: :user

  validates :name, :nickname, :bio, :location, presence: true

  scope :artists, -> { where(is_artist: true) }
  scope :search,    ->  (name){ where("name LIKE ?", "%#{name}%") }


  def as_json(options={})
    {
      user_id:        user_id,
      name:           name,
      nickname:       bio,
      location:       location,
      bio:            bio,
      url:            "/artists/#{id}",
      avatar:         rails_blob_url(self.avatar)
    }

  end

  def email
    user = User.find(self.user_id)

    return user.email
  end
end
