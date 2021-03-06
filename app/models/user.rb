class User < ActiveRecord::Base
  
    validates :name, presence: true, length: { minimum: 4, maximum: 30 }
    validates :email, presence: true, length: { minimum: 5, maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
    before_validation { email.downcase! }
    has_secure_password
    validates :password, length: { minimum:6 }
    has_many :posts
    has_many :favorites, dependent: :destroy
    mount_uploader :profile_pic, ProfileUploader
end
