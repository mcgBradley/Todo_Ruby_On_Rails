require "rails_helper"

feature "User sorts todos aphabetically" do
    scenario "successfully" do
        sign_in

        create_todo "Exercise"
        create_todo "Buy milk"

        click_on "Sort alphabetically"

        expect("Buy milk").to appear_before("Exercise")
    end
end