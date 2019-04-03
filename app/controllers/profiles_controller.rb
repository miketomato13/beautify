class ProfilesController < ApplicationController
  def index
    if params[:artists]
      @profiles = Profile.artists
    else
      @profiles = Profile.all
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.find_or_initialize_by(user_id: current_user.id)
    @profile.assign_attributes(profile_params)
    @profile.save
    redirect_to root_path
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: "Profile updated"
    else
      redirect_to edit_profile_path(@profile), alert: @profile.errors.full_messages.to_sentence
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private


  def profile_params
    params.require(:profile).permit(:name, :nickname, :bio, :location, :is_artist, :avatar)
  end
end
