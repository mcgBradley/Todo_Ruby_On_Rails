require "rails_helper"

feature ".index" do
    before do
        sign_in
    end

    context "when selecting alphabetical sort" do
        before do
            create_two_worded_todos
        end

        it "sorts todos alphabetically" do
            select_sort("Sort alphabetically")

            expect("Buy milk").to appear_before("Exercise")
        end
    end

    context "when selecting newest to oldest sort" do
        before do
            create_two_worded_todos
        end

        it "sorts todos newest to oldest" do
            select_sort("Sort newest to oldest")

            expect("Buy milk").to appear_before("Exercise")
        end
    end

    context "when selecting oldest to newest sort" do
        before do
            create_two_worded_todos
        end

        it "sorts todos oldest to newest" do
            select_sort("Sort oldest to newest")

            expect("Exercise").to appear_before("Buy milk")
        end
    end

    context "when selecting reverse alphabetical sort" do
        before do
            create_two_worded_todos
        end

        it "sorts todos reverse alphabetically" do
            select_sort("Sort alphabetically DESC")

            expect("Exercise").to appear_before("Buy milk")
        end
    end

    context "when selecting no sort" do
        before do
            create_two_worded_todos
        end

        it "does not sort the todos" do
            select_sort("No sort")

            expect("Exercise").to appear_before("Buy milk")
        end
    end

    context "when sorting no todos alphabetically" do
        it "does not detect a todo" do
            select_sort("Sort alphabetically")

            expect(page).not_to display_li
        end
    end

    context "when sorting numbers alphabetically" do
        before do
            create_todo "A"
            create_todo "1"
            create_todo "@"
        end

        it "sorts numbers before letters" do
            select_sort("Sort alphabetically")

            expect("1").to appear_before("A")
        end

        it "sorts numbers before symbols" do
            select_sort("Sort alphabetically")

            expect("1").to appear_before("@")
        end
    end

    context "when creating empty todo" do
        before do
            create_todo ""
            create_todo "A"
        end

        it "lists the empty todo" do
            expect(page).to display_todo ""
        end
    end

    context "when sorting empty todo with a todo" do
        it "appears before the non-empty todo" do
            select_sort("Sort alphabetically")

            expect("").to appear_before("A")
        end
    end
end
