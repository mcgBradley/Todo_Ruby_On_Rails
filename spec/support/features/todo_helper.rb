module Features
    def create_todo(todo_title)
        click_on "Add a new todo"
        fill_in "Title", with: todo_title
        click_on "Submit"
    end

    def display_li
        have_css ".todos li"
    end

    def display_todo(todo_title)
        have_css ".todos li", text: todo_title
    end

    def display_completed_todo(todo_title)
        have_css ".todos li.completed", text: todo_title
    end

    def select_sort(sort)
        select sort, from: "sort"
        click_button "Submit"
    end

    def before_sort_select
        create_todo "Exercise"
        create_todo "Buy milk"
    end
end