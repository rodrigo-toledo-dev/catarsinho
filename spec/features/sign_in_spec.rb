require 'rails_helper'


describe "Visitors access your account" do
  let!(:user){create(:user)}
  before do
    visit root_path
  end

  context "See header links" do
    it "without auth see header links" do
      expect(page).to have_link('Início', href: root_path)
      expect(page).to have_link('Faça seu cadastro', href: new_user_registration_path)

      expect(page).to have_content('Catarsinho')
      expect(page).to have_content('Vamos lá! Nossos projetos atuais')
    end
  end


  context 'Fill sign in' do
    before do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Acessar sua conta'
    end

    it "user fill the fields and its ok" do
      expect(page).to have_link('Novo projeto')
      expect(page).to have_link('Edite sua conta')
      expect(page).to have_link('Sair!')
    end

    it "sign out with success" do
      click_link 'Sair!'
      expect(page).to have_link('Faça seu cadastro')
    end
  end
end
