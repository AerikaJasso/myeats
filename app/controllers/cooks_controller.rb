class CooksController < ApplicationController

  def index
    @cooks = Cook.all
  end

  def new
    @cook = Cook.new
  end

  def create
    @cook = Cook.new(cook_params)
    if @cook.save
      flash[:success] = "Welcome #{@cook.cook_name}. Nice to have you join the community!"
      redirect_to cook_path(@cook)
    else
      render "new"
    end
  end

  def edit
    @cook = Cook.find(params[:id])
  end

  def show
    @cook = Cook.find(params[:id])
  end

  def  update
    @cook = Cook.find(params[:id])
    if @cook.update(cook_params)
      flash[:success]= "Your profile was updated!"
      redirect_to @cook
    else
      render "edit"

    end
  end

  private

  def cook_params
    params.require(:cook).permit(:cook_name, :email, :password, :password_confirmation)
  end
end