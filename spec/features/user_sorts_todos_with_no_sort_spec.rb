require "rails_helper"

feature "User sorts todos with no sort" do
    scenario "successfully" do
        sign_in

        create_todo "Exercise"
        create_todo "Buy milk"

        click_on "No sort"

        expect("Exercise").to appear_before("Buy milk")
    end
end