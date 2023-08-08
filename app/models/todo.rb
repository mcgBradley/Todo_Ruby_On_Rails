class Todo < ApplicationRecord
    paginates_per 4
    def completed?
        completed_at?
    end

    def complete!
        touch :completed_at
    end

    def mark_incomplete!
        update_column :completed_at, nil
    end
end
