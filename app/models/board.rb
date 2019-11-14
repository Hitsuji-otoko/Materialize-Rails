class Board < ApplicationRecord
    belongs_to :user
    has_many :likes, -> {order(:created_at => :desc)}, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user, dependent: :destroy
    
    mount_uploader :image, ImageUploader

    def self.search(search)
        return Board.all unless search
        Board.where(['title LIKE ?', "%#{search}%"])
    end

    def is_liked user
        Like.find_by(user_id: user.id, board_id: id)
    end
end
