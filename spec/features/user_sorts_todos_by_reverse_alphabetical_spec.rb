require "rails_helper"

feature "User sorts todos alphabetically DESC" do
    scenario "successfully" do
        sign_in

        create_todo "Buy milk"
        create_todo "Exercise"

        select "Sort alphabetically DESC", :from => "sort"

        click_on "Submit"

        expect("Exercise").to appear_before("Buy milk")
    end
end