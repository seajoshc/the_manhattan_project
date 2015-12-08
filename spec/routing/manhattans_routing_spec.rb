require 'rails_helper'

RSpec.describe ManhattansController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/manhattans').to route_to('manhattans#index')
    end

    it 'routes to #new' do
      expect(get: '/manhattans/new').to route_to('manhattans#new')
    end

    it 'routes to #show' do
      expect(get: '/manhattans/1').to route_to('manhattans#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/manhattans/1/edit').to route_to('manhattans#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/manhattans').to route_to('manhattans#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/manhattans/1').to route_to('manhattans#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/manhattans/1').to route_to('manhattans#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/manhattans/1').to route_to('manhattans#destroy', id: '1')
    end
  end
end
