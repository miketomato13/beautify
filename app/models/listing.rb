class Listing < ApplicationRecord
  include Rails.application.routes.url_helpers
  before_save { |listing| listing.city = listing.city.downcase }

  belongs_to :user

  has_one :profile, through: :user

  has_many :biddings

  has_many_attached :images

  validates :title, presence: true
  validates :description, presence: true
  validates :address, :city, :state, :length, :height, :due_date, :budget, presence: true

  scope :with_unviewed_biddings, -> { joins(:biddings).where(biddings: { viewed: false }).distinct }
  scope :search,    ->  (city){ where("city LIKE ?", "%#{city}%") }

  delegate :name, to: :profile, prefix: true

  def as_json(options={})
    {
      id:             id,
      title:          title,
      description:    description,
      address:        address,
      city:           city,
      state:          state,
      length:         length,
      height:         height,
      budget:         budget,
      due_date:       due_date&.strftime('%-m/%-d/%y'),
      location:       "/listings/#{id}",
      images:         images.map{ |image| rails_blob_url(image) }
    }
  end
end
