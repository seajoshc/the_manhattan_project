require 'rails_helper'

RSpec.describe 'manhattans/show', type: :view do
  before(:each) do
    @manhattan = assign(:manhattan, Manhattan.create!(
                                      name: 'Name',
                                      recipe: 'MyText',
                                      num_cherries: 1,
                                      establishment: 'Establishment',
                                      city: 'City',
                                      notes: 'MyText',
                                      rocks: false
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Establishment/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
