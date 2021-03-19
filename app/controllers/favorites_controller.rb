class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    info = Info.find(params[:info_id])
    current_user.like(info)
    flash[:success] = 'お気に入りしました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    info = Info.find(params[:info_id])
    current_user.unlike(info)
    flash[:success] = 'お気に入りを解除しました'
    redirect_back(fallback_location: root_path)
  end
end
