class TodoItemsController < ApplicationController
    before_action :set_todo_list
    before_action :set_todo_item, except: [:create]

    def create
        @todo_item = @todo.todo_items.create(todo_item_params)
        redirect_to @todo
    end

    def destroy
        if @todo_item.destroy
            flash[:success] = "Todo list item was deleted."
        else
            flash[:error] = "Todo list item could not be deleted."
        end
        redirect_to @todo
    end

    def complete 
        @todo_item.update_attribute(:completed_at, Time.now)
        redirect_to @todo, notice: "Todo list item complelted"
    end
    private

    def set_todo_list
        @todo = Todo.find(params[:todo_id])
    end

    def set_todo_item
        @todo_item = @todo.todo_items.find(params[:id])
    end

    def todo_item_params
        params[:todo_item].permit(:content)
    end
end
