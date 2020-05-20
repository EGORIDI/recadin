class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  scope :custom_display, -> { order(:created_at).last(20)} # adding .reverse after last(20) would do
end
