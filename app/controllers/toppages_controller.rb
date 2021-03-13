class ToppagesController < ApplicationController
  def index
    if logged_in?
      @info = current_user.infos.build
      @infos = current_user.feed_infos.order(id: :desc).page(params[:page])
    end
  end
end
