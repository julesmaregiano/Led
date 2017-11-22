class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :disponibility]
  before_action :params_user, only: [:home]


  def home
  end

  private

  def params_user
    @user = current_user
  end

end
