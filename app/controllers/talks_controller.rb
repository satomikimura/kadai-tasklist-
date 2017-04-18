class TalksController < ApplicationController
  def index
      @talks = Talk.all
  end

  def show
      @talks = Talk.find(params[:id])
  end

  def new
      @talks = Talk.new
  end

  def create
    @talks = Talk.new(talks_params)
    if @talks.save
      flash[:success] = 'talk が正常に投稿されました'
      redirect_to @talks
    else
      flash.now[:danger] = 'talk が投稿されませんでした'
      render :new
    end
  end

  def edit
      @talks = Talk.find(params[:id])
  end
  
  def update
    @talks = Talk.find(params[:id])
    if @talks.update(talks_params)
      flash[:success] = 'talk は正常に更新されました'
      redirect_to @talks
    else
      flash.now[:danger] = 'talk は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @talks = Talk.find(params[:id])
    @talks.destroy

    flash[:success] = 'Talk は正常に削除されました'
    redirect_to talks_url
  end
  
  
  private

  # Strong Parameter
  def talks_params
    params.require(:talk).permit(:content)
  end

  
end