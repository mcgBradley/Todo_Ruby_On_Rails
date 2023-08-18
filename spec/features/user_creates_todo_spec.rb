require "rails_helper"

feature "User creates todo" do
    scenario "successfully" do
        sign_in

        create_todo "Buy milk"

        expect(page).to display_todo "Buy milk"
    end

    context "when creating empty todo" do
        before do
            sign_in
            create_todo ""
        end

        it "lists the empty todo" do
            expect(page).not_to display_todo ""
        end
    end
end