class ProfileImage < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles=>{:large =>"896x541>", :thumb => "158x137>"}
end
