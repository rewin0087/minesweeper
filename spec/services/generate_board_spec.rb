require 'rails_helper'

RSpec.describe GenerateBoard do
  describe '#has_mine?' do
    let!(:board) { create(:board, width: 5, height: 5, no_of_mines: 5) }
    let(:generated_board) { described_class.new(board) }
    let(:plotted_mines) { generated_board.plotted_mines }
    let(:free_mine_slots) { generated_board.board_slots - plotted_mines }

    subject { generated_board.has_mine?(x: mine_locaton[:x], y: mine_locaton[:y]) }

    context 'when has mine plotted' do
      let(:mine_locaton) { plotted_mines.first }

      it { is_expected.to eq(true) }
    end

    context 'when has no mine plotted' do
      let(:mine_locaton) { free_mine_slots.first }

      it { is_expected.to eq(false) }
    end
  end
end
