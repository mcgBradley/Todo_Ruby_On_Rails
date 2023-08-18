module TodosHelper
    def todos_sort_select_options
        options_for_select(TodosController::ORDER_OPTIONS.keys.map {|item| [I18n.translate("sort_options.#{item}"), item]}, selected: params[:sort].presence || TodosController::DEFAULT_ORDER)
    end
end