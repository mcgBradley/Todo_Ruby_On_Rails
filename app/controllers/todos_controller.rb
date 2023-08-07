class TodosController < ApplicationController
    before_action :authenticate
    def index
        @sort_Type = "none"
        
        if params[:sort]
            @sort_Type = params[:sort]
        end
        
        if @sort_Type == "none"
            @todos = current_user.todos
        elsif @sort_Type == "alphabetical"
            @todos = current_user.todos.order(:title)
        elsif @sort_Type == "new_to_old"
            @todos = current_user.todos.order('created_at DESC')
        elsif @sort_Type == "alphabetical_desc"
            @todos = current_user.todos.order('title DESC')
        elsif @sort_Type == "old_to_new"
            @todos = current_user.todos.order('created_at ASC')
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