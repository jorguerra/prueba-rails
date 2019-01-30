class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def new
  end

  def create
    @todo = Todo.create(todo_params)
    @todo.save
    redirect_to todos_path
  end

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end

end
