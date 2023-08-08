require "rails_helper"

feature "User sorts todos aphabetically" do
    scenario "successfully" do
        sign_in

        create_todo "Exercise"
        create_todo "Buy milk"

        select "Sort alphabetically ascending", from: "sort"
        
        click_button "Submit"

        expect("Buy milk").to appear_before("Exercise")
    end
end