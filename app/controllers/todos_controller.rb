class TodosController < ApplicationController
    before_action :authenticate

    DEFAULT_ORDER = "old_to_new".freeze
    ORDER_OPTIONS = {
        "alphabetical" => {title: :asc},
        "new_to_old" => {created_at: :desc},
        "alphabetical_desc" => {title: :desc},
        "old_to_new" => {created_at: :asc}
    }.tap {|h| h.default = h[DEFAULT_ORDER] }.freeze

    def index
        @todos = current_user.todos.order(ORDER_OPTIONS[params[:sort]]).page(params[:page])
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