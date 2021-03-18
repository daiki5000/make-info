class InfosController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @info = current_user.infos.build(info_params)
    if @info.save
      flash[:success] = 'メッセージを投稿しました'
      redirect_to root_url
    else
      @infos = current_user.feed_infos.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました'
      render 'toppages/index'
    end
  end
  
  def edit
    @info = Info.find(params[:id])
  end
  
  def update
    @info = Info.find(params[:id])
    if @info.update(info_params)
      flash[:success] = 'infoが更新されました'
      redirect_to root_path
    else
      flash.now[:danger] = 'infoは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @info.destroy
    flash[:success] = 'メッセージを削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def info_params
    params.require(:info).permit(:content)
  end
  
  def correct_user
    @info = current_user.infos.find_by(id: params[:id])
    unless @info
      redirect_to root_url
    end
  end
  
end
