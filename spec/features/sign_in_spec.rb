require 'rails_helper'


describe "Visitors access your account" do
  before do
    visit root_path
  end

  scenario 'Fill the fields and sign in' do
    expect(page).to have_content('Catarsinho')
    expect(page).to have_content('Vamos lá! Nossos projetos atuais')
  end
end
