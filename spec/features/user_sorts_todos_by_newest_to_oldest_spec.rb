require "rails_helper"

feature "User sorts todos newest to oldest" do
    scenario "successfully" do
        sign_in

        create_todo "Exercise"
        create_todo "Buy milk"

        select "Sort newest to oldest", :from => "sort"

        click_on "Submit"

        expect("Buy milk").to appear_before("Exercise")
    end
end