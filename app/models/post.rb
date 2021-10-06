class Post < ApplicationRecord
    mount_uploader :picture, PictureUploader
    validates :comment, presence: true, length: { minimum: 4}
    belongs_to :user 
end
