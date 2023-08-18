require "rails_helper"

feature "User sorts todos oldest to newest" do
    scenario "successfully" do
        sign_in

        create_todo "Exercise"
        create_todo "Buy milk"

        select "Sort oldest to newest", :from => "sort"

        click_on "Submit"

        expect("Exercise").to appear_before("Buy milk")
    end
end