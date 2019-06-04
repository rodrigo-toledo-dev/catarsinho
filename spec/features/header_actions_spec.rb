require 'rails_helper'


describe "Simple tests about the header rules" do
  let!(:user){create(:user)}
  before do
    visit root_path
  end

  scenario 'Not registered user see the links' do
    expect(page).to have_link('Início', href: root_path)
    expect(page).to have_link('Faça seu cadastro', href: new_user_registration_path)
  end

  context "Logged user" do
    before do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Acessar sua conta'
    end
    scenario 'Not see the sign up link' do
      expect(page).not_to have_link('Faça seu cadastro')
    end
  end
end
