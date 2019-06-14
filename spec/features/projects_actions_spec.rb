require 'rails_helper'


describe "Simple tests about the header rules" do
  let!(:user){create(:user)}
  before do
    visit root_path
  end

  context "Logged user can add contribution for yourself" do
    before do
      create_list(:project, 4, user_id: user.id)
      create_list(:project, 4)
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Acessar sua conta'
    end

    scenario 'User will see all the projects but your projects dont have link' do
      expect(page).to have_link('Quero ajudar este projeto', count: 8)
    end
  end

end
