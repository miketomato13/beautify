class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :populate_notifications


  def after_sign_in_path_for(resource)
    if current_user.profile.nil?
      new_profile_path
    else
      root_path
    end
  end

  private

  def populate_notifications
    if user_signed_in?
      @listings_with_unviewed_biddings = current_user.listings.with_unviewed_biddings
      @approved_or_denied_biddings_unviewed = current_user.biddings.approved_or_denied_but_not_viewed_by_bidder
    end
  end
end
