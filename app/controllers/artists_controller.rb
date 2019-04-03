class ArtistsController < ApplicationController
  def index
    respond_to do |format|
    format.html do
      @artists = Profile.artists
    end
    format.json do
      @names      = params[:name] ? Profile.artists.search(params[:name]) : Profile.artists
      @location   = params[:location] ? Profile.artists.where(:location => params[:location]) : Profile.artists
      page        = (params[:page] || 1).to_i
      per_page    = 5
      total_pages = (Profile.artists.count.to_f / per_page).ceil
      total_pages = 1 if total_pages.zero?
      render        json: { names: @names, artists: @location, page: page, totalPages: total_pages }
      # format.json { render :show, status: :created, location: @tester }
  end
end
end


  def show
  end
end
