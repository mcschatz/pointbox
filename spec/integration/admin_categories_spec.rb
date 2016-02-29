require "rails_helper"

describe 'admin - integration', type: :feature do
  context "admin views dashboard" do
    it "views category index" do
      admin = User.create(name: "admin",
                          password: "password",
                          role: 1)

      ApplicationController.any_instance.stub(:current_user).and_return(admin)

      visit admin_rewards_path
      expect(page).to have_content("All Categories")
    end
  end
end