require 'rails_helper'

RSpec.describe 'manhattans/edit', type: :view do
  before(:each) do
    @manhattan = assign(:manhattan, Manhattan.create!(
                                      name: 'MyString',
                                      recipe: 'MyText',
                                      num_cherries: 1,
                                      establishment: 'MyString',
                                      city: 'MyString',
                                      notes: 'MyText',
                                      rocks: true
    ))
  end

  it 'renders the edit manhattan form' do
    render

    assert_select 'form[action=?][method=?]', manhattan_path(@manhattan), 'post' do
      assert_select 'input#manhattan_name[name=?]', 'manhattan[name]'

      assert_select 'textarea#manhattan_recipe[name=?]', 'manhattan[recipe]'

      assert_select 'input#manhattan_num_cherries[name=?]', 'manhattan[num_cherries]'

      assert_select 'input#manhattan_establishment[name=?]', 'manhattan[establishment]'

      assert_select 'input#manhattan_city[name=?]', 'manhattan[city]'

      assert_select 'textarea#manhattan_notes[name=?]', 'manhattan[notes]'

      assert_select 'input#manhattan_rocks[name=?]', 'manhattan[rocks]'
    end
  end
end
