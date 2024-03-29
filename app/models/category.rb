# app/models/category.rb
class Category < ApplicationRecord
  belongs_to :user
  has_many :user_transactions, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :icon, presence: true

  after_commit :attach_icon_url, if: -> { icon.attached? }

  private

  def attach_icon_url
    host = Rails.env.production? ? 'example.com' : 'localhost:3000'
    update_column(:icon_url, Rails.application.routes.url_helpers.rails_blob_url(icon, host:))
  end
end
