class Post < ActiveRecord::Base
    validates :comment, presence: true, length: { minimum: 4}
    belongs_to :user
    has_many :favorites, dependent: :destroy
    mount_uploader :picture, PictureUploader
end
