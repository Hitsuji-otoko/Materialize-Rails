class CommonBoard < ApplicationRecord
    def self.search(search)
        return CommonBoard.all unless search
        CommonBoard.where(['title LIKE ?', "%#{search}%"])
    end
end
