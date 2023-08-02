class TodosController < ApplicationController
    before_action :authenticate
    def index
        if params[:sort] == 'alphabetical'
            @todos = current_user.todos.order(:title)
        else
            @todos = current_user.todos
        end
    end

    def new
        @todo = Todo.new
    end

    def create
        current_user.todos.create(todo_params)
        redirect_to todos_path
    end

    private

    def todo_params
        params.require(:todo).permit(:title)
    end

end