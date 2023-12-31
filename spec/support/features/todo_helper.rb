module Features
    def create_todo(todo_title)
        click_on "Add a new todo"
        fill_in "Title", with: todo_title
        click_on "Submit"
    end

    def create_todos(todos_collection)
        todos_collection.each do |todo| 
            create_todo(todo)
        end
    end

    def create_pagination_todos()
        create_todos(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"])
    end

    def display_todo(todo_title)
        have_css ".todos li", text: todo_title
    end

    def display_completed_todo(todo_title)
        have_css ".todos li.completed", text: todo_title
    end

    def display_li
        have_css ".todos li"
    end

    def select_sort(sort)
        select sort, from: "sort"
        click_button "Submit"
    end

    def create_two_worded_todos
        create_todo "Exercise"
        create_todo "Buy milk"
    end
end