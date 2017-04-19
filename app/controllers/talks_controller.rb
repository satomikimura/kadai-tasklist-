class TalksController < ApplicationController
    before_action :set_task, only:[:show, :edit, :update, :destroy]
  
  def index
      @talks = Talk.all.page(params[:page]).per(15)
      @talks = Talk.order(created_at: :desc).page(params[:page]).per(15)
  end

  def show
  end

  def new
      @talks = Talk.new
  end

  def create
    @talks = Talk.new(talks_params)
    if @talks.save
      flash[:success] = 'タスク が正常に投稿されました'
      redirect_to @talks
    else
      flash.now[:danger] = 'タスク が投稿されませんでした'
      render :new
    end
  end

  def edit
  end
  
  def update
    @talks = Talk.find(params[:id])
    if @talks.update(talks_params)
      flash[:success] = 'タスク は正常に更新されました'
      redirect_to @talks
    else
      flash.now[:danger] = 'タスク は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @talks.destroy
    flash[:success] = 'タスク は正常に削除されました'
    redirect_to talks_url
  end
  
  private
  # Strong Parameter
  
  def talks_params
    params.require(:talk).permit(:content, :status)
  end
    
    def set_task
        @talks = Talk.find(params[:id])
    end
end