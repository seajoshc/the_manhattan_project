require 'rails_helper'

RSpec.describe 'Manhattans', type: :request do
  describe 'GET /manhattans' do
    it 'works! (now write some real specs)' do
      get manhattans_path
      expect(response).to have_http_status(200)
    end
  end
end
