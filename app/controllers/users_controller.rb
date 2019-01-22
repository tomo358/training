class UsersController < ApplicationController
  def index
    @user = User.new
    @select_user = User.new
    @users = User.all
  end

  def user
    @user = User.new(
       name: client.user("yama_nobe").name,
       screen_name: client.user("yama_nobe").screen_name,
       description: client.user("yama_nobe").description,
     )
  end

  def select_user
    if request.post?
     @select_user = User.new(
       name: client.user(params[:text]).name,
       screen_name: client.user(params[:text]).screen_name,
       description: client.user(params[:text]).description,
     )
    end
  end

  private
  def client
    require 'twitter'
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.user_consumer_key
      config.consumer_secret = Rails.application.secrets.user_consumer_secret
      config.access_token = Rails.application.secrets.user_access_token
      config.access_token_secret = Rails.application.secrets.user_access_token_secret
    end

    return client
  end
end
