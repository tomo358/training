class Blog < ApplicationRecord

  belongs_to :user

  scope :index_all, -> {
    select(:id, :title, :content, :created_at, :updated_at, :image, :user_id)
    .order(created_at: :asc)
    .includes(:user)
  }

  paginates_per 10

  mount_uploader :image, ImageUploader
end
