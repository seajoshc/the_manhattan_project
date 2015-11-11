require 'rails_helper'

RSpec.describe 'manhattans/index', type: :view do
  before(:each) do
    assign(:manhattans, [
      Manhattan.create!(
        name: 'Name',
        recipe: 'MyRecipe',
        num_cherries: 1,
        establishment: 'Establishment',
        city: 'City',
        notes: 'MyNotes',
        rocks: false
      ),
      Manhattan.create!(
        name: 'Name',
        recipe: 'MyRecipe',
        num_cherries: 1,
        establishment: 'Establishment',
        city: 'City',
        notes: 'MyNotes',
        rocks: false
      )
    ])
  end

  it 'renders a list of manhattans' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'MyRecipe'.to_s, count: 2
    assert_select 'tr>td', text: 1.to_s, count: 2
    assert_select 'tr>td', text: 'Establishment'.to_s, count: 2
    assert_select 'tr>td', text: 'City'.to_s, count: 2
    assert_select 'tr>td', text: 'MyNotes'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
