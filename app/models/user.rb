class User < ApplicationRecord
  has_many :boards, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_boards, through: :likes, source: :board

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def already_liked?(board)
    self.likes.exists?(board_id: board.id)
  end
end
