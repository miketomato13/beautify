class ListingsController < ApplicationController
  before_action :set_listing, only: [:show]



   def create
     @listing = Listing.new(listing_params)
     @listing.user = current_user
     if @listing.save
       redirect_to root_path, notice: "Success! Space Pending Beautification!"
     else
       redirect_to root_path, alert: @listing.errors.full_messages.to_sentence
     end
   end

   def new
     @listing = Listing.new
   end

   def index
     respond_to do |format|
       format.html do
         @listing = Listing.new
       end
       format.json do
         listings    = (params[:city]) ? Listing.search(params[:city]) : Listing.all
         page        = (params[:page] || 1).to_i
         per_page    = 5
         total_pages = (listings.count.to_f / per_page).ceil
         total_pages = 1 if total_pages.zero?
         @listings   = listings.paginate(page: page, per_page: per_page)
         render json: { listings: @listings, page: page, totalPages: total_pages }
       end
     end
   end


  def show
    @biddings = @listing.biddings
    @biddings.update_all(viewed: true) if current_user == @listing.user
    @biddings.where(user: current_user).update_all(viewed_by_bidder: true)
    @my_bids = @biddings.select{|b| b.user == current_user}
  end



  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :length, :city, :state, :tags, :height, :due_date, :budget, :address, images: [])
  end
end
