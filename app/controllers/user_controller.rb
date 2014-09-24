class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    x_forwarded_ip = request.env['HTTP_X_FORWARDED_FOR']
    ip = request.remote_ip

    if get_my_location(ip).nil?
      ip = '74.125.113.104'
    end

    remote_ip_location = get_my_location(ip)
    if x_forwarded_ip.present?
      @location = get_my_location(x_forwarded_ip.split(',')[0])
      if @location.nil?
        @location = remote_ip_location
      end
    else
      @location = remote_ip_location
    end
  end

  private

  def get_my_location(ip)
    SimpleGeolocation::Geocoder.new(ip).geocode!
  end
end

