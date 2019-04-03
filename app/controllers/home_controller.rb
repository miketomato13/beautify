class HomeController < ApplicationController
  def index
  end

  def search
    search = params[:search]
    redirect_to "/listings?search=#{search}"
  end

end
