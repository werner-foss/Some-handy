class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy 
  accepts_nested_attributes_for :technologies, reject_if: lambda {|attrs| attrs['name'].blank?}
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image
  
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader
  
  scope :angular_portfolio, -> { where(subtitle:'Angular') }
  scope :rails_portfolio, -> { where(subtitle:'Ruby on Rails') }
  
  def self.by_position
    order("position ASC")
  end
 
  after_initialize :set_defaults
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height:'350',width:'150')
    self.thumb_image ||= Placeholder.image_generator(height:'50',width:'50')
  end
end