class GenerateBoard
  def initialize(board)
    @board = board
    @x_axis = (0...board.width).to_a
    @y_axis = (0...board.height).to_a
  end

  def has_mine?(x:, y:)
    plotted_mines.any? { |mine| mine[:x] == x && mine[:y] == y }
  end

  def plotted_mines
    @plotted_mines ||= board_slots.sample(board.no_of_mines)
  end

  def board_slots
    @board_slots ||= x_axis.map { |x| y_axis.map { |y| { x: x, y: y } } }.flatten.uniq
  end

  private

    attr_reader :board, :x_axis, :y_axis
end
