require 'rails_helper'

describe 'Homepage' do
  it 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'Paynow')

  end
end