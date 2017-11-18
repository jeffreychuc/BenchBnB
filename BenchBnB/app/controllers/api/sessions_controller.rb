class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(username, password)
    if @user
      login(@user)
    else
      flash[:errors] = ["Invalid username or password"]
      render status: 401
    end
  end

  def destroy
    if current_user
      render json: {}
    else 
      render status: 404
    end
  end
end
