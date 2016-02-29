require "rails_helper"

feature "user creates a new account" do
  scenario "with valid attributes" do
    visit root_path
    expect(current_path).to eq("/")

    click_on "Sign Up"
    expect(current_path).to eq("/users/new")

    fill_in "user[name]", with: "Mimi"
    fill_in "user[password]", with: "password"
    click_on "Submit"
    expect(current_path).to eq("/users/1")

    assert page.has_content?("Welcome, Mimi")
  end
end