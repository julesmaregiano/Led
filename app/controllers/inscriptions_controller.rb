class InscriptionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:disponibility, :checkpoint]
  after_action :verify_authorized, except: [:disponibility, :checkpoint, :confirmation]

  def disponibility
    @user = User.find_by_first_name("Jo")
    @bookings = Booking.where(diagnostician: @user)
    @dates = @bookings.map{ |booking| booking.set_at}
    session[:address] = nil
    session[:date] = nil
    session[:hour] = nil

    unless params[:query].nil?
      @address = params[:query][:address]
      @address_geocoded = Geocoder.coordinates(params[:query][:address])
    end
    session[:page] = 1
  end

  def checkpoint
   session[:date] = params[:query][:date]
   session[:hour] = params[:query][:hour]
   session[:page] = 2
   redirect_to new_user_registration_path
  end

  def confirmation
    session[:page] = 3
  end
end
