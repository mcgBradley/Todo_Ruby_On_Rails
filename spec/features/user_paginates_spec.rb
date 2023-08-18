require "rails_helper"

feature "%= paginate %" do
    before do
        sign_in

        create_pagination_todos
    end

    context "when selecting" do
        it "Last >>" do
            click_on("Last")
            
            expect(page).to display_todo "I"
        end

        it "<< First" do
            click_on("Last")
            click_on("First")

            expect(page).to display_todo "A"
        end

        it "numbered page like 2" do
            click_on("2")

            expect(page).to display_todo "E"
        end
    end
end