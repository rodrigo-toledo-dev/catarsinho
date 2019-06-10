require 'rails_helper'


describe "Simple tests about the header rules" do
  let!(:user){create(:user)}
  before do
    visit root_path
  end

  context 'Visitor see all the projects' do
    before do
      create_list(:project, 9)
    end

    # scenario 'see all the projects' do
    #   project = Project.first
    #   click_link('Quero ajudar este projeto', href: project_path(project))
    #   expect(page).to have_selector('#project_detail', visible: true)
    # end

  end

  context "Logged user cant add contribution for yourself" do
    before do
      create_list(:project, 3, user_id: user.id)
      create_list(:project, 4)
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Acessar sua conta'
    end

    scenario 'User will see all the projects but your projects dont have link' do
      expect(page).to have_link('Quero ajudar este projeto', count: 4)
    end
  end

end
