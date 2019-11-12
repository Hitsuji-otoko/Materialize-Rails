class Board < ApplicationRecord
    belongs_to :user
    
    def self.search(search)
        return Board.all unless search
        Board.where(['title LIKE ?', "%#{search}%"])
    end
end
