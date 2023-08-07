require "rails_helper"

feature ".index" do
    before do
        sign_in

        create_todo "Exercise"
        create_todo "Buy milk"
    end

    context "when selecting" do
        it "alphabetical sort" do
            select_sort("Sort alphabetically")

            expect("Buy milk").to appear_before("Exercise")
        end

        it "newest to oldest" do
            select_sort("Sort newest to oldest")

            expect("Buy milk").to appear_before("Exercise")
        end

        it "oldest to newest" do
            select_sort("Sort oldest to newest")

            expect("Exercise").to appear_before("Buy milk")
        end

        it "reverse alphabetical" do
            select_sort("Sort alphabetically DESC")

            expect("Exercise").to appear_before("Buy milk")
        end

        it "no sort" do
            select_sort("No sort")

            expect("Exercise").to appear_before("Buy milk")
        end
    end
end

feature "edge case" do
    before do
        sign_in
    end

    context "when sorting" do
        it "nothing" do
            select_sort("Sort alphabetically")

            expect(page).not_to display_li
        end
    end
end

feature "edge case" do
    before do
        sign_in

        create_todo "A"
        create_todo "1"
        create_todo "@"
    end

    context "when sorting numbers" do
        it "with letters" do
            select_sort("Sort alphabetically")

            expect("1").to appear_before("A")
        end

        it "with symbols" do
            select_sort("Sort alphabetically")

            expect("1").to appear_before("@")
        end
    end
end

feature "edge case" do
    before do
        sign_in

        create_todo ""
        create_todo "A"
    end

    context "when creating empty todo" do
        it "lists the empty todo" do
            expect(page).to display_todo ""
        end
    end

    context "when sorting empty todo" do
        it "with a todo" do
            select_sort("Sort alphabetically")

            expect("").to appear_before("A")
        end
    end
end
