class CooksController < ApplicationController
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

  def show

  end

  private

  def cook_params
    params.require(:cook).permit(:cook_name, :email, :password, :password_confirmation)
  end
end