class BiddingsController < ApplicationController
  before_action :set_bidding, only: [:approve, :deny]
  def new
    @bidding = listing.biddings.new
  end


  def index
  end

  def show
  end

  def create

    @bidding = listing.biddings.new(bidding_params)
    @bidding.user_id = current_user.id

    if @bidding.save
      redirect_to root_path, notice: "offer made"
    else
      redirect_to root_path, alert: @bidding.errors.full_messages.to_sentence
    end
  end

  def approve
    @bidding.update(apprv_deny: true)
    redirect_to @bidding.listing, notice: "Bidding Approved"
  end

  def deny
    @bidding.update(apprv_deny: false)
    redirect_to @bidding.listing, notice: "Bidding Denied"
  end

  private

  def set_bidding
    @bidding = Bidding.find(params[:id])
  end

  def bidding_params
    params.require(:bidding).permit(:title, :body, :offer, images: [])
  end

  def listing
    Listing.find(params[:listing_id])
  end
end
