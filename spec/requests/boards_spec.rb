require 'rails_helper'

RSpec.describe "Boards", type: :request do
  describe "GET /index" do
    let!(:boards) { create_list(:board, 5) }

    before { get '/boards' }

    it 'return success' do
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(assigns(:boards)).to match_array(boards)
    end
  end

  describe "POST /create" do
    context 'when success' do
      let(:board_params) do
        {
          board: {
            email: 'email@email.com',
            width: 5,
            height: 5,
            no_of_mines: 5,
            name: 'Test Board'
          }
        }
      end

      before { post '/boards', params: board_params }

      it 'return success' do
        created_record = assigns(:board)

        expect(created_record.email).to eq('email@email.com')
        expect(created_record.width).to eq(5)
        expect(created_record.height).to eq(5)
        expect(created_record.no_of_mines).to eq(5)
        expect(response).to redirect_to(board_path(created_record.id))
      end
    end

    context 'when has error' do
      let(:board_params) do
        {
          board: {
            email: 'email@email.com'
          }
        }
      end

      let(:errors) do
        ["Height can't be blank", "Name can't be blank", "No of mines can't be blank", "Width can't be blank"]
      end

      before { post '/boards', params: board_params }

      it 'return error' do
        record = assigns(:board)

        expect(record.errors.full_messages).to match_array(errors)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:home)
      end
    end
  end

  describe "GET /boards/:id" do
    let!(:board) { create(:board) }

    before { get "/boards/#{board.id}" }

    it 'return success' do
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(assigns(:board).id).to eq(board.id)
    end
  end

  describe "GET /home" do
    let!(:boards) { create_list(:board, 20) }
    let(:recent_boards) { Board.recent }

    before { get '/' }

    it 'return success' do
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:home)
      expect(assigns(:boards)).to match_array(recent_boards)
    end
  end
end
