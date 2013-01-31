class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #attr_accessible :email, :password, :password_confirmation
  has_attached_file :pic, :styles=>{:thumb => "158x137>", :large =>"896x541>"}
  has_attached_file :avatar, :styles=>{:large =>"896x541>", :thumb => "158x137>"}
  belongs_to :country
  has_many :bookings
  has_many :profile_images
end
