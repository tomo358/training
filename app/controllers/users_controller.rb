class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def user
   require 'twitter'

   client = Twitter::REST::Client.new do |config|
     config.consumer_key = Rails.application.secrets.user_consumer_key
     config.consumer_secret = Rails.application.secrets.user_consumer_secret
     config.access_token = Rails.application.secrets.user_access_token
     config.access_token_secret = Rails.application.secrets.user_access_token_secret
   end

   @user = User.new(name: client.user.name)

 end
end
