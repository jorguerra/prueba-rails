class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def create
    @todo = Todo.create(todo_params)
    @todo.save
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.delete
    redirect_to todos_path
  end

  def complete
    @todo = Todo.find(params[:id])
    @todo.update({completed: true})
    redirect_to todos_path
  end

  def list
    @todos = Todo.all
  end

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end

end
