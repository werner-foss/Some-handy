class Portfolio < ApplicationRecord
  validates_presence_of :title, :body
  scope :angular_portfolio, -> { where(subtitle:'Angular') }
  scope :rails_portfolio, -> { where(subtitle:'Ruby on Rails') }
end