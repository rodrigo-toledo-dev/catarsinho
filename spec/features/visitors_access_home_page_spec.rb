require 'rails_helper'


describe "Visitors access home page" do
  before do
    visit root_path
  end

  scenario 'Visitors see base of application' do
    expect(page).to have_content('Catarsinho')
    expect(page).to have_content('Vamos lá! Nossos projetos atuais')
  end
end
