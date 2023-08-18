require "rails_helper"

feature ".destroy" do
    before do
        sign_in
    end

    context "when deleting Buy milk todo" do
        before do
            create_two_worded_todos
        end

        it "deletes Buy milk todo successfully" do
            form = page.find(:id => 'Buy milk deletion')
            form.click_button("Delete to-do")

            expect(page).not_to display_todo "Buy milk"
        end
    end
end