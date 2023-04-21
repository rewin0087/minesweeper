class Board < ApplicationRecord

  validates :email, :name, :width, :height, :no_of_mines, presence: true

  delegate :has_mine?, :plotted_mines, :board_slots, to: :generated_board

  scope :recent, -> { order('created_at DESC').limit(10) }
  default_scope { order('created_at DESC') }

  def generated_board
    @generated_board ||= GenerateBoard.new(self)
  end
end
